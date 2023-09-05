Start-Transcript -Path "c:\test.txt"

$scriptFolderPath = "$env:SystemDrive\OSDCloud\testing"
If(!(Test-Path -Path $scriptFolderPath)) {
    New-Item -Path $scriptFolderPath -ItemType Directory -Force | Out-Null
}

Install-Module AutopilotOOBE -Force -Verbose
Start-AutopilotOOBE -Verbose

Stop-Transcript
