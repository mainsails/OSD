# Build OSDCloud Workspace

# Define variables
$WorkspacePath = 'C:\OSDCloud\Workspace-Dev'

# Create OSDCloud Workspace
New-OSDCloudWorkspace -WorkspacePath $WorkspacePath

# Build WinPE
Edit-OSDCloudWinPE -CloudDriver Dell,IntelNet,USB -StartURL 'https://raw.githubusercontent.com/mainsails/OSD/main/OSDCloud-Dev.ps1'
