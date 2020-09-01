# FirefoxProfiles
Firefox offers to use different profiles. 

- https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles 
- https://support.mozilla.org/de/kb/firefox-profile-erstellen-und-loeschen

My first thought was to store the corresponding files directly in OneDrive. This should allow me to have my profiles backed up at any time. Unfortunately the OneDrive sync client always reported an annoying message. "The sync cannot be performed because this file (or more than one) is open in another program."
To save my profiles nevertheless I decided to copy the relevant files automatically into my desired OneDrive directory when I logged in. 

To achieve this I created a script that copies the files from "C:\Users\" + $myUserName + "\AppData\Roaming\Mozilla\Firefox\Profiles" to my desired OneDrive folder. For this I use robocopy.

I created another script so that this script can be easily and quickly integrated into the Windows Task Scheduler. This script creates a basic task and needs further settings in the Task Scheduler.

### Recover one or profiles
- manually, check the links above
