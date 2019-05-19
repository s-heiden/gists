# !/usr/bin/env python
#
# Title:            Import_Safari_Bookmarks_To_Chrome.py
# Author:           s-heiden
# Setup:            make sure, terminal has full disk access: http://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/
#
import codecs
import datetime
import json
import os
import shutil
import sys

from biplist import *


def main():
    home_path = os.environ['HOME']
    safari_path = home_path + '/Library/Safari/Bookmarks.plist'
    chrome_path = home_path + '/Library/Application Support/Google/Chrome/Default/Bookmarks'

    if not os.path.exists(safari_path):
        print '[Error] The bookmark files of safari do not exist! path: ' + safari_path
        return

    if not os.path.exists(chrome_path):
        print '[Error] The bookmark files of chrome do not exist! path: ' + chrome_path
        return

    with open(safari_path, 'r') as f:
        try:
            safari_bookmarks = readPlist(safari_path)
            chrome_bookmarks = convert(safari_bookmarks)
            create_backup(chrome_path)
            with codecs.open(chrome_path, 'w+', encoding="utf-8") as fp:
                json.dump(chrome_bookmarks, fp, ensure_ascii=False)

        except (InvalidPlistException, NotBinaryPlistException), e:
            print 'Not a plist:', e


def create_backup(chrome_path):
    backup_path = chrome_path + '.' + datetime.datetime.today().strftime('%Y-%m-%d_%H-%M-%S') + '.bak'
    print 'Creating backup of Chrome bookmarks at ' + backup_path + '...'
    shutil.copyfile(chrome_path, backup_path)


def convert(safari_bookmarks):
    children_node = safari_bookmarks['Children']
    return {
        'version': 1,
        'roots': {
            'synced': {
                'children': [],
                'type': 'folder'
            },
            'other': {
                'type': 'folder',
                'children': map(to_chrome_node, elems_other_than(lst=children_node, key='Title', value='BookmarksBar'))
            },
            'bookmark_bar': to_chrome_node(first_child_having(parent=children_node, key='Title', value='BookmarksBar'))
        }
    }


def to_chrome_node(safari_node):
    # handle ignored safari nodes
    if 'WebBookmarkIdentifier' in safari_node and safari_node['WebBookmarkIdentifier'] == 'History':
        print 'Ignoring Safari history...'
    elif 'Title' in safari_node and safari_node['Title'] == 'com.apple.ReadingList':
        print 'Ignoring Safari reading list...'
    # handle leaves
    elif 'WebBookmarkType' in safari_node and safari_node['WebBookmarkType'] == 'WebBookmarkTypeLeaf':
        return {
            'type': 'url',
            'url': safari_node['URLString'],
            'name': safari_node['URIDictionary']['title']
        }
    # handle lists
    elif safari_node['WebBookmarkType'] == 'WebBookmarkTypeList':
        return {
            'type': 'folder',
            'name': safari_node['Title'],
            'children': map(to_chrome_node, safari_node['Children']) if 'Children' in safari_node else {}
        }
    return {}


def first_child_having(parent, key, value):
    return filter(lambda child_node: (key in child_node and child_node[key] == value), parent)[0]


def elems_other_than(lst, key, value):
    return filter(lambda child_node: (key not in child_node or child_node[key] != value), lst)


if __name__ == '__main__':
    sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'site-packages'))
    main()
