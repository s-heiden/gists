#!/bin/bash
#
# author:           s-heiden
# name:             Unzip_ZIP_and_TAR_7Z_Files_Into_a_Folder_With_the_Name_of_the_Respective_Archive.sh
#

for i in *.zip; do
    [ -f "$i" ] || break
    destinationDir=${i%.zip}
    mkdir "$destinationDir"
    unzip "$i" -d "$destinationDir"
    trash "$i"
done

for i in *.tar.7z; do
    [ -f "$i" ] || break
    7za x "$destinationDir"/"$i"
    trash "$i"
done