# OSDCloud

- Create Template : [OSDCloud-Setup-Template.ps1](OSDCloud-Setup-Template.ps1)
- Create Workspace : [OSDCloud-Setup-Workspace.ps1](OSDCloud-Setup-Template.ps1)
  - The WinPE image runs : [OSDCloud-WinPE.ps1](OSDCloud-WinPE.ps1)
    - Start OSDCloud
    - Creates `SetupComplete.cmd` : Runs during OOBE
      - Adds deployment info to Windows registry
      - Moves OSDCloud logs to `$env:ProgramData\Logs\Management`
      - Ejects boot CD on virtual machines
    - Creates `C:\Windows\System32\Autopilot.cmd` : Autopilot helper
    - Creates `C:\Windows\System32\Tech.cmd` : Helper GUI
