# Update drivers and Windows

$Params = @{
    Autopilot = $false
    #RemoveAppx = "CommunicationsApps","OfficeHub","People","Skype","Solitaire","ZuneMusic","ZuneVideo"
    UpdateDrivers = $true
    UpdateWindows = $true
}
Start-OOBEDeploy @Params
