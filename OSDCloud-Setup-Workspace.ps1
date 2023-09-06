# Build OSDCloud Workspace

# Define variables
$WorkspacePath = 'C:\OSDCloud\Workspace'

# Create OSDCloud Workspace
New-OSDCloudWorkspace -WorkspacePath $WorkspacePath

# Build WinPE
Edit-OSDCloudWinPE -CloudDriver Dell,IntelNet,USB -StartURL 'https://raw.githubusercontent.com/mainsails/OSD/main/OSDCloud-WinPE.ps1'
