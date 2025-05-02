# Verificar si el script se está ejecutando como administrador
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($identity)

if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Add-Type -AssemblyName PresentationFramework

# Definir el XAML como cadena de texto
$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        Title="Instalador y Mantenimiento"
        Width="650" Height="900">
    <ScrollViewer VerticalScrollBarVisibility="Auto" HorizontalScrollBarVisibility="Auto">
        <Grid Background="#F5F5F5" Margin="10">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>

            <TextBlock Text="Seleccione las aplicaciones a instalar:" 
                       FontSize="18" FontWeight="Bold" 
                       HorizontalAlignment="Center" 
                       Margin="0,0,0,20" 
                       Grid.Row="0"/>

            <!-- Herramientas de Comunicación -->
            <StackPanel Margin="0,10,0,20" Grid.Row="1">
                <TextBlock Text="Herramientas de Comunicación" 
                           FontSize="14" FontWeight="Bold" 
                           Margin="0,10,0,5"/>
                <WrapPanel HorizontalAlignment="Center" Margin="0,10,0,0">
                    <CheckBox Name="DiscordCheck" Content="Discord" Margin="5"/>
                    <CheckBox Name="WhatsAppCheck" Content="WhatsApp" Margin="5"/>
                    <CheckBox Name="AnyDeskCheck" Content="AnyDesk" Margin="5"/>
                </WrapPanel>
            </StackPanel>

            <!-- Herramientas Multimedia -->
            <StackPanel Margin="0,10,0,20" Grid.Row="2">
                <TextBlock Text="Herramientas Multimedia" 
                           FontSize="14" FontWeight="Bold" 
                           Margin="0,10,0,5"/>
                <WrapPanel HorizontalAlignment="Center" Margin="0,10,0,0">
                    <CheckBox Name="AIMPCheck" Content="AIMP" Margin="5"/>
                    <CheckBox Name="VLCCheck" Content="VLC" Margin="5"/>
                    <CheckBox Name="SpotifyCheck" Content="Spotify" Margin="5"/>
                    <CheckBox Name="PowerToysCheck" Content="PowerToys" Margin="5"/>
                </WrapPanel>
            </StackPanel>

            <!-- Herramientas de Desarrollo -->
            <StackPanel Margin="0,10,0,20" Grid.Row="3">
                <TextBlock Text="Herramientas de Desarrollo" 
                           FontSize="14" FontWeight="Bold" 
                           Margin="0,10,0,5"/>
                <WrapPanel HorizontalAlignment="Center" Margin="0,10,0,0">
                    <CheckBox Name="VSCodeCheck" Content="Visual Studio Code" Margin="5"/>
                    <CheckBox Name="PythonCheck" Content="Python" Margin="5"/>
                    <CheckBox Name="CplusplusCheck" Content="C++ (MinGW)" Margin="5"/>
                    <CheckBox Name="NodejsCheck" Content="Node.js" Margin="5"/>
                    <CheckBox Name="GitCheck" Content="Git" Margin="5"/>
                    <CheckBox Name="JavaCheck" Content="Java (JDK)" Margin="5"/>
                    <CheckBox Name="VS2019Check" Content="Visual Studio 2019" Margin="5"/>
                    <CheckBox Name="FileZillaCheck" Content="FileZilla" Margin="5"/>
                    <CheckBox Name="GitHubDesktopCheck" Content="GitHub Desktop" Margin="5"/>
                    <CheckBox Name="NotepadppCheck" Content="Notepad++" Margin="5"/>
                </WrapPanel>
            </StackPanel>

            <!-- Herramientas de Juegos -->
            <StackPanel Margin="0,10,0,20" Grid.Row="4">
                <TextBlock Text="Juegos" 
                           FontSize="14" FontWeight="Bold" 
                           Margin="0,10,0,5"/>
                <WrapPanel HorizontalAlignment="Center" Margin="0,10,0,0">
                    <CheckBox Name="LunarClientCheck" Content="Lunar Client" Margin="5"/>
                    <CheckBox Name="MinecraftLauncherCheck" Content="Minecraft Launcher" Margin="5"/>
                    <CheckBox Name="SteamCheck" Content="Steam" Margin="5"/>
                    <CheckBox Name="EpicCheck" Content="Epic Games" Margin="5"/>
                    <CheckBox Name="GeForceNowCheck" Content="GeForce NOW" Margin="5"/>

                    
                </WrapPanel>
            </StackPanel>

            <!-- Navegadores -->
            <StackPanel Margin="0,10,0,20" Grid.Row="5">
                <TextBlock Text="Navegadores" 
                           FontSize="14" FontWeight="Bold" 
                           Margin="0,10,0,5"/>
                <WrapPanel HorizontalAlignment="Center" Margin="0,10,0,0">
                    <CheckBox Name="ChromeCheck" Content="Google Chrome" Margin="5"/>
                    <CheckBox Name="FirefoxCheck" Content="Mozilla Firefox" Margin="5"/>
                    <CheckBox Name="BraveCheck" Content="Brave" Margin="5"/>
                    <CheckBox Name="OperaGXCheck" Content="Opera GX" Margin="5"/>
                    <CheckBox Name="EdgeCheck" Content="Microsoft Edge" Margin="5"/>
                </WrapPanel>
            </StackPanel>

            <!-- Herramientas Útiles -->
            <StackPanel Margin="0,10,0,20" Grid.Row="6">
                <TextBlock Text="Herramientas Útiles" 
                           FontSize="14" FontWeight="Bold" 
                           Margin="0,10,0,5"/>
                <WrapPanel HorizontalAlignment="Center" Margin="0,10,0,0">
                    <CheckBox Name="SevenZipCheck" Content="7-Zip" Margin="5"/>
                    <CheckBox Name="WinRARCheck" Content="WinRAR" Margin="5"/>
                    <CheckBox Name="OBSCheck" Content="OBS Studio" Margin="5"/>
                    <CheckBox Name="CPUIDCheck" Content="CPU-Z" Margin="5"/>
                    <CheckBox Name="LibreOfficeCheck" Content="LibreOffice" Margin="5"/>
                    <CheckBox Name="AcrobatCheck" Content="Adobe Acrobat Reader" Margin="5"/>
                    <CheckBox Name="WarpCheck" Content="Cloudflare Warp" Margin="5"/>
                    <CheckBox Name="OfficeCheck" Content="Microsoft Office" Margin="5"/>
                </WrapPanel>
            </StackPanel>

            <!-- Botones de acción -->
            <StackPanel Grid.Row="7" Margin="0,20,0,0" HorizontalAlignment="Center">
                <WrapPanel Orientation="Horizontal" HorizontalAlignment="Center">
                    <Button Name="InstallButton" Content="Instalar Seleccionados" Width="200" Height="30" Margin="10"/>
                    <Button Name="CleanButton" Content="Limpiar Archivos Temporales" Width="200" Height="30" Margin="10"/>
                    <Button Name="DefragButton" Content="Desfragmentar" Width="200" Height="30" Margin="10"/>
                    <Button Name="HighPerfButton" Content="Habilitar Alto Rendimiento" Width="200" Height="30" Margin="10"/>
                    <Button Name="InstallGamingDepsButton" Content="Instalar Dependencias de Juegos" Width="420" Height="30" Margin="10"/>
                </WrapPanel>

                <WrapPanel Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,20,0,0">
                    <Button Name="InstallWSLButton" Content="Instalar WSL (Ubuntu)" Width="200" Height="30" Margin="10"/>
                    <Button Name="CleanWSLButton" Content="Borrar Distro WSL" Width="200" Height="30" Margin="10"/>
                </WrapPanel>
            </StackPanel>
        </Grid>
    </ScrollViewer>
</Window>

"@

# Cargar el XAML
$reader = (New-Object System.Xml.XmlTextReader (New-Object System.IO.StringReader $xaml))
$window = [Windows.Markup.XamlReader]::Load($reader)

# Lista extendida de aplicaciones
$appList = @{
    "DiscordCheck" = "Discord.Discord"
    "WhatsAppCheck" = "9NKSQGP7F2NH"
    "AnyDeskCheck" = "AnyDeskSoftwareGmbH.AnyDesk"
    "EdgeCheck" = "Microsoft.Edge"
    "AIMPCheck" = "AIMP.AIMP"
    "VLCCheck" = "VideoLAN.VLC"
    "SpotifyCheck" = "Spotify.Spotify"
    "PowerToysCheck" = "Microsoft.PowerToys"
    "VSCodeCheck" = "Microsoft.VisualStudioCode"
    "PythonCheck" = "Python.Python.3.12"
    "CplusplusCheck" = "Microsoft.VisualStudio.2019.BuildTools"
    "NodejsCheck" = "OpenJS.NodeJS"
    "GitCheck" = "Git.Git"
    "JavaCheck" = "EclipseAdoptium.Temurin.17.JDK"
    "VS2019Check" = "Microsoft.VisualStudio.2019.Community"
    "OfficeCheck" = "Microsoft.Office"
    "FileZillaCheck" = "FileZilla.FileZilla"
    "GitHubDesktopCheck" = "GitHub.GitHubDesktop"
    "NotepadppCheck" = "Notepad++.Notepad++"
    "LunarClientCheck" = "Moonsworth.LunarClient"
    "MinecraftLauncherCheck" = "Mojang.MinecraftLauncher"
    "SteamCheck" = "Valve.Steam"
    "EpicCheck" = "EpicGames.EpicGamesLauncher"
    "WinRARCheck" = "RARLab.WinRAR"
    "SevenZipCheck" = "7zip.7zip"
    "LibreOfficeCheck" = "TheDocumentFoundation.LibreOffice"
    "ChromeCheck" = "Google.Chrome"
    "FirefoxCheck" = "Mozilla.Firefox"
    "BraveCheck" = "BraveSoftware.BraveBrowser"
    "OperaGXCheck" = "Opera.OperaGX"
    "OBSCheck" = "OBSProject.OBSStudio"
    "CPUIDCheck" = "CPUID.CPU-Z"
    "AcrobatCheck" = "Adobe.Acrobat.Reader.64-bit"
    "WarpCheck" = "Cloudflare.Warp"
    "GeForceNowCheck" = "NVIDIA.GeForceNOW"

}

# Acción para instalar
$installButton = $window.FindName("InstallButton")
$installButton.Add_Click({
    foreach ($app in $appList.Keys) {
        $checkBox = $window.FindName($app)
        if ($checkBox -and $checkBox.IsChecked) {
            Write-Host "Instalando: $($checkBox.Content)" -ForegroundColor Cyan
            Start-Process winget -ArgumentList "install --id $($appList[$app]) --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow -Wait
        }
    }
    Write-Host "Instalación completada." -ForegroundColor Green
})

# Acciones para limpiar, desfragmentar, WSL igual que tu script original...
# Acción para ejecutar el script de limpieza desde "extras"
$cleanButton = $window.FindName("CleanButton")
$cleanButton.Add_Click({
    $scriptPath = "$PSScriptRoot\extras\borrartemp.ps1"
    if (Test-Path $scriptPath) {
        Write-Host "Ejecutando limpieza de archivos temporales..." -ForegroundColor Yellow
        Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$scriptPath`"" -Wait
    } else {
        Write-Host "El script de limpieza no fue encontrado en 'extras'." -ForegroundColor Red
    }
})

# Acción para instalar WSL (Ubuntu)
$installWSLButton = $window.FindName("InstallWSLButton")
$installWSLButton.Add_Click({
    Write-Host "Instalando WSL (Ubuntu)..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", "wsl --install" -NoNewWindow -Wait
    Write-Host "WSL (Ubuntu) instalado correctamente." -ForegroundColor Green
})

# Acción para borrar la distro de WSL
$cleanWSLButton = $window.FindName("CleanWSLButton")
$cleanWSLButton.Add_Click({
    Write-Host "Borrando la distro de WSL..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", "wsl --unregister Ubuntu" -NoNewWindow -Wait
    Write-Host "Distro de WSL eliminada." -ForegroundColor Green
})

# Acción para ejecutar el script de desfragmentación
$defragButton = $window.FindName("DefragButton")
$defragButton.Add_Click({
    $defragScriptPath = "$PSScriptRoot\extras\Defragmentar.ps1"
    if (Test-Path $defragScriptPath) {
        Write-Host "Ejecutando desfragmentación del disco..." -ForegroundColor Yellow
        Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "`"$defragScriptPath`"" -Wait
    } else {
        Write-Host "El script de desfragmentación no fue encontrado en 'extras'." -ForegroundColor Red
    }
})
# Acción para habilitar el plan de energía de Alto Rendimiento
$highPerfButton = $window.FindName("HighPerfButton")
$highPerfButton.Add_Click({
    Write-Host "Habilitando el plan de energía de Alto Rendimiento..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", "powercfg -setactive SCHEME_MIN" -NoNewWindow -Wait
    Write-Host "Plan de energía de Alto Rendimiento activado." -ForegroundColor Green
})


# Acción para instalar dependencias de juegos
$installGamingDepsButton = $window.FindName("InstallGamingDepsButton")
$installGamingDepsButton.Add_Click({
    Write-Host "Instalando dependencias de juegos..." -ForegroundColor Yellow
    Start-Process winget -ArgumentList "install Microsoft.VCRedist.2015+.x64 --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow -Wait
    Start-Process winget -ArgumentList "install Microsoft.DirectX --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow -Wait
    Start-Process winget -ArgumentList "install Microsoft.DotNet.DesktopRuntime.6 --silent --accept-package-agreements --accept-source-agreements" -NoNewWindow -Wait
    Write-Host "Dependencias de juegos instaladas correctamente." -ForegroundColor Green
})


# Mostrar ventana
$window.ShowDialog()
