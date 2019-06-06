# !/usr/bin/env python
#
# title:            trello_archiver
# description:      archive trello cards older than n days from a given board
# author:           ?, s-heiden
# date:             2019-05-19
# setup:            create a json file with your settings at ~/.config/.trello_archiver.json
#

import datetime
import json
from datetime import timedelta
from os.path import expanduser

import requests
with open(expanduser('~') + '/.config/.trello_archiver.json', 'r') as f:
    trello_secrets = json.load(f)

# get your key on https://trello.com/app-key
key = trello_secrets['key']

# get board id from url: https://trello.com/b/<board_id>/<board_slug>
board_id = trello_secrets['board_id']

# get token at: https://trello.com/1/authorize?key=<key>&name=trello_archive_cards_older_than&expiration=never&response_type=token&scope=read,write
token = trello_secrets['token']

# get list_id: https://trello.com/1/boards/<board_id>/lists/
list_id = trello_secrets['list_id']

# define age of cards starting from which they are archived
days = trello_secrets['days']


def get_old_cards():
    archive_before = (datetime.date.today() -
                      timedelta(days=days)).strftime("%Y-%m-%d")
    old_cards_url_pattern = 'https://trello.com/1/lists/{list_id}/cards/?before={archive_before}&token={token}&key={key}'
    old_cards = requests.get(
        old_cards_url_pattern.format(
            list_id=list_id, archive_before=archive_before, key=key, token=token)
    ).json()
    return old_cards


def put_into_archive(cards):
    archive_url_pattern = 'https://trello.com/1/cards/{}/closed?token={token}&key={key}&value=true'
    for i, card in enumerate(cards):
        requests.put(archive_url_pattern.format(
            card['id'], token=token, key=key))
        print('{}%'.format(float(i) / len(cards) * 100))


put_into_archive(get_old_cards())
