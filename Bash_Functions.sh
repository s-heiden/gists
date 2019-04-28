#
# name:         Bash_Functions.sh
# author:       s-heiden
# description:  Collection of user functions that can be imported into .bash_profile by adding line `source /path/to/Bash_Functions.sh'
#

#
# Usage: hello [recipient]
#
hello() {
    osascript -e "on run argv" \
                -e "return \"hello, \" & item 1 of argv & \".\"" \
                -e "end run" \
                "$1"
}

#
# Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
#
compresspdf() { 
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1" 
}

#
# Usage: srt [quotedMovieNameWithYearInBrackets] [otherOptions]
#
srt() {
    subliminal download -l en $1 ${2:""}
}

#
# Usage: imsg [whom] [what can contain spaces]
#
imsg() {
    osascript -e "on run argv" \
                -e "tell application \"Messages\"" \
                    -e "set targetService to 1st service whose service type = iMessage" \
                    -e "set targetBuddy to buddy (item 1 of argv) of targetService" \
                    -e "send (item 2 of argv) to targetBuddy" \
                -e "end tell" \
            -e "end run"  \
            "${1}" \
            "${*:2}"
}

# Usage chromify
chromify() { 
    python ~/.Import_Chrome_Bookmarks_To_Safari.py 
}
