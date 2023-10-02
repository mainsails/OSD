#Build OSDCloud Template

# Define variables
$TemplateName = 'WinPE-Win11-22H2-2309'

# Create OSDCloud Template
New-OSDCloudTemplate -Name $TemplateName

# Clean up Languages
$Directories = @('boot','efi','en-us','sources','fonts','resources')
Get-ChildItem "$(Get-OSDCloudTemplate)\Media"                    | Where-Object { $_.PSIsContainer } | Where-Object { $_.Name -notin $Directories } | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudTemplate)\Media\Boot"               | Where-Object { $_.PSIsContainer } | Where-Object { $_.Name -notin $Directories } | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudTemplate)\Media\EFI\Microsoft\Boot" | Where-Object { $_.PSIsContainer } | Where-Object { $_.Name -notin $Directories } | Remove-Item -Recurse -Force
