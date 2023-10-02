# Build OSDCloud Workspace

# Define variables
$WorkspacePath = 'C:\OSDCloud\PROD-OSD-Script-WinPE-ZTI-Drivers'

# Create OSDCloud Workspace
New-OSDCloudWorkspace -WorkspacePath $WorkspacePath

# Build WinPE
Edit-OSDCloudWinPE -CloudDriver Dell,IntelNet,USB -StartURL 'https://raw.githubusercontent.com/mainsails/OSD/main/PROD-OSD-Script-WinPE-ZTI-Drivers.ps1'

# Create OSD Cloud ISO
New-OSDCloudISO
