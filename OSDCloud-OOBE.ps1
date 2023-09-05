Start-Transcript -Path "c:\test.txt"

Install-Module AutopilotOOBE -Force -Verbose
Start-AutopilotOOBE -Verbose

Stop-Transcript
