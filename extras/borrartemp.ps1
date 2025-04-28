# Verificar si se ejecuta con privilegios de administrador
$adminCheck = [System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $adminCheck.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Se requieren privilegios de administrador. Elevando permisos..." -ForegroundColor Red
    Start-Process "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`"" -Verb RunAs
    exit
}

Write-Host "Borrando archivos temporales..." -ForegroundColor Yellow

# Definir rutas de carpetas temporales
$tempPaths = @($env:TEMP, "$env:LOCALAPPDATA\Temp", "C:\Windows\Temp")

foreach ($path in $tempPaths) {
    if (Test-Path $path) {
        Write-Host "Limpiando: $path" -ForegroundColor Cyan
        try {
            Get-ChildItem -Path $path -Recurse -Force | Remove-Item -Force -Recurse -Confirm:$false -ErrorAction Stop
        } catch {
            Write-Host ("Error eliminando archivos en " + $path + ": " + $_.Exception.Message) -ForegroundColor Red
        }
    } else {
        Write-Host "La carpeta $path no existe." -ForegroundColor Red
    }
}

Write-Host "Borrando archivos .tmp en C:\" -ForegroundColor Cyan
try {
    Get-ChildItem -Path "C:\" -Filter "*.tmp" -Recurse -Force -ErrorAction Stop | Remove-Item -Force -ErrorAction Stop
} catch {
    Write-Host ("Error eliminando archivos .tmp en C:\: " + $_.Exception.Message) -ForegroundColor Red
}

Write-Host "¡Limpieza completada con éxito!" -ForegroundColor Green
Read-Host "Presiona Enter para salir"
