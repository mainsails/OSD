#Build OSDCloud Template

# Define variables
$TemplateName     = 'WinPE-kb5029263'
$CumulativeUpdate = 'C:\temp\windows11.0-kb5029263-x64_4f5fe19bbec786f5e445d3e71bcdf234fe2cbbec.msu'

# Create OSDCloud Template
New-OSDCloudTemplate -Name $TemplateName -CumulativeUpdate $CumulativeUpdate

# Clean up Languages
$Directories = @('boot','efi','en-us','sources','fonts','resources')
Get-ChildItem "$(Get-OSDCloudTemplate)\Media"                    | Where-Object { $_.PSIsContainer } | Where-Object { $_.Name -notin $Directories } | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudTemplate)\Media\Boot"               | Where-Object { $_.PSIsContainer } | Where-Object { $_.Name -notin $Directories } | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudTemplate)\Media\EFI\Microsoft\Boot" | Where-Object { $_.PSIsContainer } | Where-Object { $_.Name -notin $Directories } | Remove-Item -Recurse -Force
