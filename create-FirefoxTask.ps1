#date 20.06.2020
#author HeeLoco

#I wrote the environment variables into my own variables to be flexible if they differ from the default configuration. e.g changing OneDrive (private) Path.
#I also sometimes add parameters afterwards. 


#get and set some vars 
$myUserName = $env:USERNAME;
$myTaskName = "Copy Firefox Profiles on LogON";

$myPowerShellScriptPath = "C:\Users\" + $myUserName + "\OneDrive\some Configs and Profiles\Firefox\copy-FirefoxProfiles.ps1"
# $myPowerShellScriptPath dont work in the params. Need to fix(format correctly)!
# So it is currently simply inserted as text into the var
$mySchtasksParamTR = "powershell.exe -ExecutionPolicy Bypass -File 'C:\Users\myusername\OneDrive\some Configs and Profiles\Firefox\copy-FirefoxProfiles.ps1'" #need a fix

#check for admin
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(!($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))){
    Write-Error "Please run as Administrator!"
    Start-Sleep -Seconds 5
    return 666;
}

#test if script is avaiable
if( !(Test-Path -Path $myPowerShellScriptPath -PathType Leaf)){
    Write-Host "cannot find script";
    return 666;
}
#make file always available? 

#creating basic task 
SCHTASKS /Create /TN $myTaskName /SC ONLOGON /TR $mySchtasksParamTR;

#information
Write-Host "Only a general task was created!`nPlease make the detailed settings yourself.`nTask Scheduler will opened now" -ForegroundColor Green;
Start-Sleep -Seconds 5

#start Task Scheduler GUI
taskschd.msc
