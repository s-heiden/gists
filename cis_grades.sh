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
curl -S -s -i -H "Authorization: Basic `base64 -i ./.cis_credentials`" https://cis.technikum-wien.at/cis/private/lehre/notenliste.php?stsem=alle | html2text -width 500 | grep '\d\d\d\d-\d\d' | sed 's/  [[:blank:]]*/|/g' | sort -k5,5 -t'|'
