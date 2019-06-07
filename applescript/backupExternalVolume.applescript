#!/usr/bin/osascript
#
# author:           s-heiden
# name:             backupExternalVolume
# description:      backup the content of an external volume to another volume
# date:             2014-10-01
#

global sourceRoot, backupRoot, backupFolderNameSuffix

#
# Usage ./backupExternalVolume.applescript sourcePath destinationPath [backupFolderNameSuffix]
#
on run argv
	
	#
	# user configuration:
	#
	set sourceRoot to "/Users/stefan/Dropbox"
	set backupRoot to "/Users/stefan/Downloads"
	set backupFolderNameSuffix to "_Sicherung"

	if length of argv equals 3 then
		set backupFolderNameSuffix to item 3 of argv
	end if

	if length of argv is greater than 1 then
		set sourceRoot to item 1 of argv
		set backupRoot to item 2 of argv
	end if

	backupExternalVolume()

end run


#
# functions:
#
on getDateFormatted()
	set theDate to current date
	set y to text -4 thru -1 of ("0000" & (year of theDate))
	set m to text -2 thru -1 of ("00" & ((month of theDate) as integer))
	set d to text -2 thru -1 of ("00" & (day of theDate))
	return y & m & d
end


on backupExternalVolume() 
	set emptyTrashReminder to "Have you already emptied the trash? Now, there is still time."
	set backupFolderName to getDateFormatted() & backupFolderNameSuffix
	set backupPath to backupRoot & "/" & backupFolderName
	set shellCommand to "rsync -aE --progress " & sourceRoot & " " & backupPath
	set executingMsg to "Executing now: " & shellCommand
	set completionMsg to "Synchronization completed successfully."
	set errorMsg to "Synchronization failed using user and administrator privileges."
	
	display dialog emptyTrashReminder
	display dialog executingMsg
	
	try
		do shell script shellCommand user name myUserName password myPassword
	on error
		
		try
			do shell script "sudo " & shellCommand with administrator privileges
		on error
			display dialog errorMsg
			return
		end try
		
		display dialog completionMsg
	end try
	
end



