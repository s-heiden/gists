#!/bin/bash
#
# title:            Convert MP4 or FLAC to MP3
# author:           s-heiden
# date:             2019-05-01
# requirements:     lame
#
shopt -s extglob
for filename in *(*.mp4|*.flac); do
    new_filename=${filename%.*}.mp3
    echo Converting $filename to $new_filename
    ffmpeg -i "$filename" -codec:a libmp3lame -q:a 0 -map_metadata 0 "$new_filename"
done
