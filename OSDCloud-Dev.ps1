# Start OSDCloud
Write-Host -ForegroundColor Green "Start OSDCloud"
$Params = @{
    OSVersion  = 'Windows 11'
    OSBuild    = '22H2'
    OSEdition  = 'Pro'
    OSLanguage = 'en-gb'
    OSLicense  = 'Retail'
    ZTI        = $true
    Firmware   = $false
}
Start-OSDCloud @Params

# Create C:\Windows\Setup\Scripts\SetupComplete.cmd (runs in OOBE)
Write-Host -ForegroundColor Green "Create C:\Windows\Setup\Scripts\SetupComplete.cmd"
$SetupCompleteCMD = @'
PowerShell.exe -Command Set-ExecutionPolicy RemoteSigned -Force
PowerShell.exe -Command "& { Invoke-Expression -Command (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/mainsails/OSD/main/OSDCloud-OOBE.ps1') }"
'@
$SetupCompleteCMD | Out-File -FilePath 'C:\Windows\Setup\Scripts\SetupComplete.cmd' -Encoding ascii -Force

#####

$SetCommand = @'
@echo off

:: Set the PowerShell Execution Policy
PowerShell -NoL -Com Set-ExecutionPolicy RemoteSigned -Force

:: Add PowerShell Scripts to the Path
set path=%path%;C:\Program Files\WindowsPowerShell\Scripts

:: Open and Minimize a PowerShell instance just in case
start PowerShell -NoL -W Mi

:: Install the latest AutopilotOOBE Module
start "Install-Module AutopilotOOBE" /wait PowerShell -NoL -C Install-Module AutopilotOOBE -Force -Verbose

:: Start-AutopilotOOBE
start "Start-AutopilotOOBE" PowerShell -NoL -C Start-AutopilotOOBE
:: The next line is how you would apply a CustomProfile
exit
'@
$SetCommand | Out-File -FilePath "C:\Windows\Autopilot.cmd" -Encoding ascii -Force

######


# Restart Computer in 10 seconds
Write-Host  -ForegroundColor Green "Restart computer in 10 seconds"
Start-Sleep -Seconds 10
wpeutil reboot
