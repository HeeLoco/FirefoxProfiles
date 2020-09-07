# FirefoxProfiles
Firefox offers to use different profiles. Simply great for my needs!

- https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles 
- https://support.mozilla.org/de/kb/firefox-profile-erstellen-und-loeschen

My first thought was to store the corresponding files directly in OneDrive. This should allow me to have my profiles backed up at any time. Unfortunately the OneDrive sync client always reported an annoying message. "The sync cannot be performed because this file (or more than one) is open in another program."
To save my profiles nevertheless I decided to copy the relevant files automatically into my desired OneDrive directory when I logged in. 

To achieve this I created a script that copies the files from "C:\Users\" + $myUserName + "\AppData\Roaming\Mozilla\Firefox\Profiles" to my desired OneDrive folder. For this I use robocopy.

I created another script so that this script can be easily and quickly integrated into the Windows Task Scheduler. This script creates a basic task and needs further settings in the Task Scheduler.

## Recommended presettings
- call the Firefox Profile manager
- create or rename some profiles (for better differentiation)
- change path to desired OneDrive profile path
- check links above

## Usage
- Change var $mySchtasksParamTR (in create-FirefoxTask.ps1) to the script location of copy-FirefoxProfiles.ps1 (need to be fixed)
- Change var $myOneDriveDestinationPath (in copy-FirefoxProfiles.ps1) if needed
- Use the .bat file to create a Task easily without changing the execution policy
- Edit further desired settings in the Task Scheduler
- Log off/on and check the logfile in $myOneDriveDestinationPath 


## Recover one or profiles
- manually, check the links above

## Note 
I am aware that an automatic sync of Firefox exists. 
However, I use several profiles and it does not suit to my handling. 
For example I use one profile as admin user, company user, private user and several test accounts.
I also have the possibility to create my own standard profile for certain scenarios and recreate it again and again. 
