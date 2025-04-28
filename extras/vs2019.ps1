# Verificar si se ejecuta con privilegios de administrador
if (-not ([System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Write-Host "Instalando Visual Studio 2019 Community..." -ForegroundColor Yellow

# URL oficial del instalador de Visual Studio 2019
$vs2019InstallerUrl = "https://aka.ms/vs/16/release/vs_Community.exe"
$installerPath = "$env:TEMP\vs_Community.exe"

# Descargar el instalador
Invoke-WebRequest -Uri $vs2019InstallerUrl -OutFile $installerPath

# Ejecutar el instalador de Visual Studio 2019
Start-Process -FilePath $installerPath -ArgumentList "--quiet --norestart --wait" -NoNewWindow -Wait

Write-Host "Instalación completada de Visual Studio 2019." -ForegroundColor Green
Read-Host "Presiona Enter para salir"
