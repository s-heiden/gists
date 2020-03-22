--
-- name: connectToJustiz30Vpn.applescript
-- author: stefan.heiden@iteratec.com
-- version: 0.0.2
-- date: 2020-03-20
-- requirements:
-- .) Cisco AnyConnect Secure Mobility Client installed
-- .) JUSTIZ30.xml at /opt/cisco/anyconnect/profile/
-- .) file named ".justizvpn" containing password at ~/
--
set userFolder to ""
tell application "Finder"
	set userFolder to container of (path to desktop)
end tell
set passwordPathAlias to ((userFolder as text) & ".justizvpn")
set passwordPath to alias passwordPathAlias
set passwordLine to read passwordPath using delimiter linefeed
set targetApp to "Cisco AnyConnect Secure Mobility Client"
set shortBreak to 0.3
set longBreak to 1.4

-- Quit script if AnyConnect is already running
tell application "System Events"
	set processExists to exists process targetApp
end tell

if processExists then
	tell application targetApp
		quit
	end tell
end if

-- Close connection if running; else start connection and fill in password
tell application targetApp
	activate
end tell

delay longBreak

tell application "System Events"
	repeat until (window 1 of process targetApp exists)
		delay shortBreak
	end repeat
end tell

tell application "System Events"
	tell process targetApp
		keystroke return
	end tell
end tell

tell application "System Events"
	repeat until (window 2 of process targetApp exists)
		delay longBreak
	end repeat
end tell

delay longBreak

tell application "System Events"
	tell process targetApp
		keystroke passwordLine
		delay shortBreak
		keystroke return
		delay shortBreak
		keystroke return
	end tell
end tell

