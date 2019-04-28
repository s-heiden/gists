#!/bin/bash
#
# title:            Compress all PDFs in Current Dir Recursively
# author:           s-heiden
# date:             2019-04-28
# requirements:     'ghostscript' and 'trash' need to be installed using brew
#

# the suffix which is to be put in front of '.pdf'
suffix=".compressed"

if [[ `brew ls --versions ghostscript` > /dev/null && `brew ls --versions trash` > /dev/null ]]
then
    # set the internal field separator to \n to avoid splitting files with spaces
    IFS=$'\n'

    for i in $(find . -name '*.pdf'); do
        
        if [[ "$i" != *$suffix.pdf ]] ; then

            sourceFilename=$i
            destFilename=$(basename "$sourceFilename" .pdf)$suffix.pdf
            echo creating $destFilename …
            gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/screen -dCompatibilityLevel=1.4 -sOutputFile=$destFilename $sourceFilename
            trash $sourceFilename

        else

            echo "Skipping compressed file: $i …"
            
        fi
    done

    # set the internal field separator back to space
    unset IFS
else
    red="\033[1;31m"
    white="\033[0m"
    echo -e "$red'ghostscript' and 'trash' need to be installed (tested with version 9.26) using brew$white"
fi
