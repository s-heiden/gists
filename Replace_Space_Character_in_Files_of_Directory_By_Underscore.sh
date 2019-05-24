#!/bin/bash
#
# author:           s-heiden
# name:             Replace_Space_Character_in_Files_of_Directory_By_Underscore.sh
#
for file in * ; do
    mv "$file" "${file// /_}"
done