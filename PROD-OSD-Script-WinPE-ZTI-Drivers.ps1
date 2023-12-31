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

# Create C:\Windows\Setup\Scripts\SetupComplete.cmd (automatically runs in OOBE)
Write-Host -ForegroundColor Green "Create C:\Windows\Setup\Scripts\SetupComplete.cmd"
$SetupCompleteCMD = @'
PowerShell.exe -Command Set-ExecutionPolicy RemoteSigned -Force
PowerShell.exe -Command "& { Invoke-Expression -Command (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/mainsails/OSD/main/PROD-OSD-Script-OOBE-SetupComplete.ps1') }"
'@
$SetupCompleteCMD | Out-File -FilePath 'C:\Windows\Setup\Scripts\SetupComplete.cmd' -Encoding ascii -Force

# Create C:\Windows\System32\Tech.cmd (optional manual run with ctrl-f10 - hosted OOBE helper functions)
Write-Host -ForegroundColor Green "Create C:\Windows\System32\Tech.cmd"
$SetCommand = @'
@echo off
PowerShell.exe -Command "& { Start-OSDPad -RepoOwner mainsails -RepoName OSD -RepoFolder OSDPad }"
'@
$SetCommand | Out-File -FilePath 'C:\Windows\System32\Tech.cmd' -Encoding ascii -Force

# Restart Computer in 10 seconds
Write-Host  -ForegroundColor Green "Restart computer in 10 seconds"
Start-Sleep -Seconds 10
wpeutil reboot
