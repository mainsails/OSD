$scriptFolderPath = "$env:SystemDrive\OSDCloud\testing"
If(!(Test-Path -Path $scriptFolderPath)) {
    New-Item -Path $scriptFolderPath -ItemType Directory -Force | Out-Null
}

Write-Host -ForegroundColor DarkGray "Installing OSD PS Module"
Start-Process PowerShell -ArgumentList "-NoL -C Install-Module OSD -Force -Verbose" -Wait

Write-Host -ForegroundColor DarkGray "Installing AutopilotOOBE PS Module"
Start-Process PowerShell -ArgumentList "-NoL -C Install-Module AutopilotOOBE -Force -Verbose" -Wait

Write-Host -ForegroundColor DarkGray "Executing AutopilotOOBE Module"
Start-Process PowerShell -ArgumentList "-NoL -C Start-AutopilotOOBE" -Wait
