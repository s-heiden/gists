# !/usr/bin/env python
#
# Title:            Import_Chrome_Bookmarks_To_Safari.py
# Author:           binss, s-heiden
# Setup:            make sure, terminal has full disk access: http://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/
#

from biplist import *
import json
import datetime
import os
import sys
import shutil


class BookmarkManager:
    def __init__(self):
        self.bookmarks = []
        self.number = 0

    def load_from_safari(self, raw):
        # TODO
        print "Loading from Safari"

    def save_to_chrome(self, raw):
        print "Saving to Chrome"

    def get_number(self):
        return self.number


def main():
    home_path = os.environ['HOME']

    safari_path = home_path + "/Library/Safari/Bookmarks.plist"
    chrome_path = home_path + "/Library/Application Support/Google/Chrome/Default/Bookmarks"

    if not os.path.exists(safari_path):
        print "[Error] The bookmark files of safari do not exist! path: " + safari_path
        return

    if not os.path.exists(chrome_path):
        print "[Error] The bookmark files of chrome do not exist! path: " + chrome_path
        return

    bookmark_manager = BookmarkManager()

    with open(safari_path, "r") as f:
        try:
            safari_bookmarks = readPlist(safari_path)
            # print safari_bookmarks
            chrome_bookmarks = parse(safari_bookmarks)
            print chrome_bookmarks
        except (InvalidPlistException, NotBinaryPlistException), e:
            print "Not a plist:", e


def uri_dictionary_to_bookmark_title(object):
    title_key = "title"
    if title_key in object:
        return object[title_key]
    else:
        print 'Warning: No title element in URIDictionary.'


#
#
#
def parse(safari_bookmarks):
    children_node = safari_bookmarks['Children']
    print children_node

    chrome_bookmarks = {
        'version': 1,
        'roots': {
            'synced': {
                'type': 'Folder',
                'children': []
            },
            'other': get_other(children_node),
            'bookmark_bar': get_bookmark_bar(children_node)
        }
    }
    return chrome_bookmarks


#
#
#
def get_other(children_node):
    # TODO: Implement!
    return {}


#
#
#
def get_bookmark_bar(children_node):
    # TODO: Complete!
    title_key = 'title'
    bookmarks_bar_title = 'BookmarksBar'

    bookmarks_bar_node = filter(
        lambda child_node: title_key in child_node and child_node[title_key] == bookmarks_bar_title,
        children_node
    )

    bookmark_bar = {
        'children': [],
        'type': 'folder'
    }

    return bookmark_bar


# TODO: delete after completion
def iterate_children(object):
    #
    # define constants
    #
    children = "Children"
    title = "Title"
    should_omit_from_ui = "ShouldOmitFromUI"
    url_string = "URLString"
    web_bookmark_identifier = "WebBookmarkIdentifier"
    web_bookmark_type = "WebBookmarkType"
    uri_dictionary = "URIDictionary"

    if should_omit_from_ui in object and object[should_omit_from_ui] == True:
        return
    if web_bookmark_type in object and object[web_bookmark_type] == "WebBookmarkTypeProxy":
        return
    if title in object:
        print "\nTitle = " + object[title]
        # merke dir den title
    if web_bookmark_type in object and object[web_bookmark_type] != "WebBookmarkTypeLeaf":
        print "  WebBookmarkType = " + object[web_bookmark_type]
    if url_string in object:
        print "  " + object[url_string]
    if web_bookmark_identifier in object:
        print "  WebBookmarkIdentifier = " + object[web_bookmark_identifier]

    #
    if uri_dictionary in object:
        uri_dictionary_to_bookmark_title(object[uri_dictionary])
    if children in object:
        for obj in object[children]:
            iterate_children(obj)


if __name__ == '__main__':
    sys.path.append(os.path.join(os.path.dirname(os.path.abspath(__file__)), "site-packages"))
    main()
