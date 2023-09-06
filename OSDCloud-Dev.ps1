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
PowerShell.exe -ExecutionPolicy Bypass -Command "& { Invoke-Expression -Command (Invoke-RestMethod -Uri 'https://raw.githubusercontent.com/mainsails/OSD/main/OSDCloud-OOBE.ps1') }"
'@
$SetupCompleteCMD | Out-File -FilePath 'C:\Windows\Setup\Scripts\SetupComplete.cmd' -Encoding ascii -Force

# Restart Computer in 5 seconds
Write-Host  -ForegroundColor Green "Restart computer in 5 seconds"
Start-Sleep -Seconds 20
wpeutil reboot
