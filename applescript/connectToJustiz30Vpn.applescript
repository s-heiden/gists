--
-- name: connectToJustiz30Vpn.applescript
-- author: stefan.heiden@iteratec.com
-- version: 0.0.2
-- date: 2020-03-20
-- requirements:
-- .) Cisco AnyConnect Secure Mobility Client installed
-- .) JUSTIZ30.xml at /opt/cisco/anyconnect/profile/
-- .) file named ".justizvpn" containing password at ~/


global TARGET_APP
global CONNECT_BUTTON_LBL
global DISCONNECT_BUTTON_LBL
global BREAK_SHORT
global BREAK_LONG


set TARGET_APP to "Cisco AnyConnect Secure Mobility Client"
set CONNECT_BUTTON_LBL to "Connect"
set DISCONNECT_BUTTON_LBL to "Disconnect"
set BREAK_SHORT to 0.3
set BREAK_LONG to 1.4


--
-- Perform a callback with a timeout
--
on doWithTimeout(uiScript, timeoutSeconds)
	set endDate to (current date) + timeoutSeconds
	repeat
		try
			run script "tell application \"System Events\"
" & uiScript & "
end tell"
			
			exit repeat
			
		on error errorMessage
			if ((current date) > endDate) then
				return false
			end if
		end try
	end repeat
	return true
end doWithTimeout


on isAppRunning(appName)
	tell application "System Events" to set processExists to (exists process appName)
	return processExists
end isAppRunning


on retrievePassword()
	set userFolder to ""
	tell application "Finder"
		set userFolder to container of (path to desktop)
	end tell
	set passwordPathAlias to ((userFolder as text) & ".justizvpn")
	set passwordPath to alias passwordPathAlias
	set passwordLine to read passwordPath using delimiter linefeed
	return passwordLine
end retrievePassword


on launchApp()
	set uiScript to "tell application \"" & TARGET_APP & "\" to activate"
	doWithTimeout(uiScript, BREAK_LONG)
end launchApp


on enterPassword(password)
	tell application "System Events"
		repeat until (window 2 of process TARGET_APP exists)
			delay BREAK_LONG
		end repeat
	end tell
	
	delay BREAK_LONG
	
	tell application "System Events"
		tell process TARGET_APP
			keystroke password
			delay BREAK_SHORT
			keystroke return
			delay BREAK_SHORT
			keystroke return
		end tell
	end tell
end enterPassword


on login(passw)
	tell application "System Events" to tell process TARGET_APP to keystroke return
	enterPassword(passw)
end login


on toggleLoginState(passw)
	launchApp()
	
	set clickConnectButton to "click UI Element \"" & CONNECT_BUTTON_LBL & "\" of window 2 of application process \"" & TARGET_APP & "\""
	
	set clickDisconnectButton to "click UI Element \"" & DISCONNECT_BUTTON_LBL & "\" of window 2 of application process \"" & TARGET_APP & "\""
	
	set closeWindow to "keystroke \"w\" using command down"
	
	if doWithTimeout(clickConnectButton, BREAK_LONG) then
		enterPassword(passw)
	else
		doWithTimeout(clickDisconnectButton, BREAK_LONG)
		set closed to doWithTimeout(closeWindow, BREAK_LONG)
	end if
end toggleLoginState


on activateApp()
	set uiScript to "click UI Element \"" & TARGET_APP & "\" of list 1 of application process \"Dock\""
	doWithTimeout(uiScript, 2)
end activateApp


--
-- The entry point of this script
--
on main()
	
	set passw to retrievePassword()
	
	if isAppRunning(TARGET_APP) then
		log "Process is Running"
		activateApp()
		toggleLoginState(passw)
		
	else
		log "Starting Process"
		launchApp()
		login(passw)
	end if
	
end main

main()
