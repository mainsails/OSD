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
PowerShell.exe -Command "& { Invoke-Expression -Command (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/mainsails/OSD/main/OSDPad/Autopilot.ps1') }"
'@
$SetCommand | Out-File -FilePath "C:\Windows\System32\Autopilot.cmd" -Encoding ascii -Force

$SetCommand = @'
@echo off
PowerShell.exe -Command "& { Start-OSDPad -RepoOwner mainsails -RepoName OSD -RepoFolder OSDPad }"
'@
$SetCommand | Out-File -FilePath "C:\Windows\System32\Tech.cmd" -Encoding ascii -Force

######


# Restart Computer in 10 seconds
Write-Host  -ForegroundColor Green "Restarting computer in 10 seconds"
Start-Sleep -Seconds 10
wpeutil reboot
