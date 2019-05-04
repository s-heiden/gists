#!/bin/bash
#
# title:            Update_MP4_Title_According_To_Filename.sh
# author:           s-heiden
# date:             2019-05-01
# requirements:     ffmpeg, trash
#
if [ $# -ne 1 ] ; then
    echo "Usage: $(basename $0) Example.mp4"
else
    path=$1
    echo Setting ${path%.*} as title of ${path}…
    dirname=$(dirname "$1")
    filename=$(basename "$1")
    temppath=${dirname}/.${filename}

    ffmpeg -i "$path" -metadata Title="${path%.*}" -codec copy "$temppath"
    if [ -f "$temppath" ]; then
        trash "$path"
        mv "$temppath" "$path"
    else
        echo An Error has occurred.
    fi
fi