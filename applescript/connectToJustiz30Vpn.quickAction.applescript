--
-- create a "Quick Action" in Automator using this script and then you can assign a short cut using "System Preferences" > "Keyboard" > "Shortcuts" > "Services"
--
on run {input, parameters}
	--
	-- the location where you have put the script
	--	
	set PATH_TO_SCRIPT to "Repositories:gists:applescript:connectToJustiz30Vpn.applescript"
	
	tell application "Finder" to set userFolder to container of (path to desktop)
	set referencedScript to alias ((userFolder as text) & PATH_TO_SCRIPT)
	run script referencedScript
end run