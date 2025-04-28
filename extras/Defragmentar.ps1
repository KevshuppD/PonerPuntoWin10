# Verifica si está corriendo con privilegios de administrador
if (-not ([System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}


$drives = Get-PhysicalDisk | Where-Object { $_.MediaType -ne "Unspecified" }

foreach ($drive in $drives) {
    $partition = Get-Partition | Where-Object { $_.DiskNumber -eq $drive.DeviceId -and $_.DriveLetter }
    if ($partition) {
        $letter = $partition.DriveLetter
        if ($drive.MediaType -eq "SSD") {
            Optimize-Volume -DriveLetter $letter -ReTrim -Verbose
            Write-Host "Disco $letter optimizado correctamente."
        } else {
            Optimize-Volume -DriveLetter $letter -Defrag -Verbose
            Write-Host "Disco $letter desfragmentado correctamente."
        }
    }
}

Read-Host "Presiona Enter para salir"
