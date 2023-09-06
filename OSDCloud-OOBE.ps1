# Start logging
Start-Transcript -Path "$env:ProgramData\Logs\Management\$(Get-Date -Format yyyy-MM-dd-HHmm)-Deploy-OOBE.log"

# Create BHFT key if it does not exist
$KeyPath = "HKLM:\SOFTWARE\BHFT1"
If (-not(Test-Path -Path $KeyPath)) {
    New-Item -Path $KeyPath -Force -Verbose
}

# Add device deployment date
New-ItemProperty -Path $KeyPath -Name Deploy-Date -PropertyType String -Value $(Get-Date -Format yyyy-MM-dd-HHmm) -Force -Verbose

# Add device version
New-ItemProperty -Path $KeyPath -Name Deploy-OSVersion -PropertyType String -Value $(Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty Version) -Force -Verbose


# Add device ChassisType

function Get-ChassisType {
    [int[]]$ChassisTypes = Get-CimInstance Win32_SystemEnclosure | Select-Object -ExpandProperty ChassisTypes
    switch ($ChassisTypes) {
        { $_ -in 3, 4, 5, 6, 7, 15, 16 } {
            return 'Desktop'
        }
        { $_ -in 8, 9, 10, 11, 12, 14, 18, 21, 31, 32 } {
            return 'Laptop'
        }
        { $_ -in 30 } {
            return 'Tablet'
        }
        { $_ -in 17, 23 } {
            return 'Server'
        }
        Default {
            Write-Warning ("ChassisTypes is {0}" -f $ChassisTypes)
        }
    }
}

New-ItemProperty -Path $KeyPath -Name Deploy-ChassisType -PropertyType String -Value $(Get-ChassisType) -Force -Verbose

# Stop logging
