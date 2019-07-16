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
# Usage: chromify
#
chromify() {
    python ./python/chromify.py
}

#
# Usage: safarify
#
safarify() {
    python ./python/safarify.py
}

#
# Usage: fnd [quoted pattern]
#
fnd() {
    find / -name "$1" 2>/dev/null
}

#
# Usage: trello
#
trello() {
    python ./python/trello_archiver.py
}
