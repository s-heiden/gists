# set `brew_app` here:
set brew_app to POSIX file "/usr/local/Caskroom/filebot/4.7.9/FileBot.app/Contents/MacOS/filebot.sh"
# and run

set applications_folder to POSIX file "/Applications"
tell application "Finder"
	make alias file to brew_app at applications_folder
end tell
