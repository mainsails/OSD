# OSD

- Create Template : [PROD-OSD-Setup-Template.ps1](PROD-OSD-Setup-Template.ps1)
- Create Workspace : [PROD-OSD-Setup-Workspace.ps1](PROD-OSD-Setup-Workspace.ps1)
  - The WinPE image runs : [PROD-OSD-Script-WinPE-ZTI-Drivers.ps1](PROD-OSD-Script-WinPE-ZTI-Drivers.ps1)
    - Start OSDCloud.
      - ZTI image with driver injection.
    - Creates `C:\Windows\Setup\Scripts\SetupComplete.cmd`
      - [Hosted](https://github.com/mainsails/OSD/blob/main/PROD-OSD-Script-OOBE-SetupComplete.ps1) script runs automatically in OOBE
        - Log actions
        - Adds deployment information to Windows registry
        - Moves OSDCloud logs to `$env:ProgramData\Logs\Management`
        - Ejects boot CD on virtual machines
        - Cleanup
    - Creates `C:\Windows\System32\Tech.cmd`
      - [Hosted](https://github.com/mainsails/OSD/tree/main/OSDPad) OOBE helper functions
        - Optional manual run with ctrl-F10
    - Restart computer
