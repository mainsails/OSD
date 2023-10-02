# Update drivers and Windows

$Params = @{
    Autopilot = $false
    #RemoveAppx = "CommunicationsApps","OfficeHub","People","Skype","Solitaire","ZuneMusic","ZuneVideo"
    UpdateDrivers = $true
    UpdateWindows = $true
}
Start-OOBEDeploy @Params

# Restart Computer in 10 seconds
Write-Host  -ForegroundColor Green "Restarting computer in 10 seconds"
Start-Sleep -Seconds 10
Restart-Computer
