#!/bin/bash
#
# title:            Shutdown_Mac_in_n_Minutes
# author:           s-heiden
# date:             2019-05-06
#
minutes=$1
if [[ $minutes -ge 1 ]] ; then
	minutes=$((minutes-1))
fi
echo "The Shutdown dialog will be displayed in $minutes minutes."
osascript -e '
	on run argv
		delay 60 * (item 1 of argv)
		tell application "loginwindow" to «event aevtrsdn»
	end run
' $minutes
