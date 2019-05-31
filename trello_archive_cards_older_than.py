import datetime
import json
from datetime import timedelta

import requests

with open('.trello-secrets.json', 'r') as f:
    trello_secrets = json.load(f)

key = trello_secrets['key']  # get your key on https://trello.com/app-key
board_id = trello_secrets['board_id']  # get board id from url: https://trello.com/b/<board_id>/<board_slug>
token = trello_secrets['token']  # get token at: https://trello.com/1/authorize?key=<key>&name=trello_archive_cards_older_than&expiration=never&response_type=token&scope=read,write
list_id = trello_secrets['list_id']  # get list_id: https://trello.com/1/boards/<board_id>/lists/
days = trello_secrets['days']  # define age of cards starting from which they are archived 


def get_old_cards():
    archive_before = (datetime.date.today() - timedelta(days=days)).strftime("%Y-%m-%d")
    old_cards_url_pattern = 'https://trello.com/1/lists/{list_id}/cards/?before={archive_before}&token={token}&key={key}'
    old_cards = requests.get(
        old_cards_url_pattern.format(list_id=list_id, archive_before=archive_before, key=key, token=token)
    ).json()
    return old_cards


def put_into_archive(cards):
    archive_url_pattern = 'https://trello.com/1/cards/{}/closed?token={token}&key={key}&value=true'
    for i, card in enumerate(cards):
        requests.put(archive_url_pattern.format(card['id'], token=token, key=key))
        print('{}%'.format(float(i) / len(cards) * 100))


put_into_archive(get_old_cards())
