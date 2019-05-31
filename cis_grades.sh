#!/bin/bash
#
# title:            CIS grades
# description:      View the grades list of the CIS - the campus information system of the UAS Technikum Vienna
# author:           s-heiden
# date:             2019-05-21
# requirements:     'html2text'
# setup:            Create a file called ".cis_credentials" in the same folder as the script. 
#                   The file should contain one line with your username and password separated by a colon.
#
#                   e.g.
#
#                   sl17a0384:Pazzword123
#
curl -S -s -i -H "Authorization: Basic `base64 -i ./.cis_credentials`" https://cis.technikum-wien.at/cis/private/lehre/notenliste.php?stsem=alle \
    | pup '#notenliste' \
    | sed 's/<\/td>/;<\/td>/g' \
    | html2text -ascii -style pretty -width 360 \
    | grep '\d\d\d\d-\d\d' \
    | sed 's/\(  \)\{2,99\}//g' \
    | sed 's/\( ;\)/;/g' \
    | sed 's/\(; \)/;/g' \
    | sed 's/\(;;\)/;/g' \
    | sort -k 5 -t ';' \
    | column -t -s ';'
