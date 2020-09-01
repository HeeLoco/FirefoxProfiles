#date 20.06.2020
#author HeeLoco


#I wrote the environment variables into my own variables to be flexible if they differ from the default configuration. e.g changing OneDrive (private) Path.
#I also sometimes add parameters afterwards. 

#get and set some vars 
$myUserName = $env:USERNAME;
$myComputerName = $env:COMPUTERNAME;

$myOneDriveGeneralPath = $env:OneDriveConsumer; #C:\Users\myusername\OneDrive
$myOneDrivePrivatePath = $env:USERPROFILE + "\OneDrive" #C:\Users\myunsername\OneDrive

$myFirefoxProfilePath = "C:\Users\" + $myUserName + "\AppData\Roaming\Mozilla\Firefox\Profiles";
$myOneDriveDestinationPath = "C:\Users\" + $myUserName + "\OneDrive\some Configs and Profiles\Firefox\Profiles\" + $myComputerName + "\" + $myUserName;

#log file
$myLogFile = $myOneDriveDestinationPath + "\" + (get-date -UFormat "%Y-%m-%d") + ".log";

#check if paths exist
#firefox profile path 
if( !(Test-Path -Path $myFirefoxProfilePath -PathType Container)){
    return 666;
}

#general onedrive path
if( !(Test-Path -Path $myOneDriveGeneralPath -PathType Container)){
    return 666;
}

#correct onedrive (private)
if( ! ($myOneDriveGeneralPath -eq $myOneDrivePrivatePath)){
    return 666;
}

#create a new one if there is a new user or device
if( !(Test-Path -Path $myOneDriveDestinationPath -PathType Container)){
    New-Item -Path $myOneDriveDestinationPath -ItemType Directory
}

#use robocopy to sync 
robocopy $myFirefoxProfilePath $myOneDriveDestinationPath /MIR /LOG+:$myLogFile
