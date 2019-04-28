#!/bin/bash
for f in *.m4a; do ff=${f%.m4a}.mp3; ffmpeg -i "$f" -codec:a libmp3lame -q:a 0 -map_metadata 0 "$ff"; done
for f in *.flac; do ff=${f%.flac}.mp3; ffmpeg -i "$f" -c:a libmp3lame -q:a 0 -map_metadata 0 "$ff"; done