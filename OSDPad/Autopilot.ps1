# Register with Windows Autopilot

Install-Module AutopilotOOBE -Force
Import-Module AutopilotOOBE -Force

$Params = @{
    Title           = 'Autopilot Registration'
    GroupTag        = 'Workstation'
    GroupTagOptions = 'Workstation','Shared'
    Hidden          = 'AddToGroup','Assign','AssignedComputerName','AssignedUser','PostAction'
    Assign          = $true
    Run             = 'NetworkingWireless'
}
AutopilotOOBE @Params
