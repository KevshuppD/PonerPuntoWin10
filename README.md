# Instalador y Mantenimiento Automático de Aplicaciones

Este script en PowerShell crea una interfaz gráfica para instalar, limpiar y mantener diversas aplicaciones y herramientas útiles en un sistema Windows. Utiliza XAML para crear la ventana de la interfaz y permite seleccionar las aplicaciones que deseas instalar de manera fácil y rápida.

## Funcionalidades

El script ofrece varias funcionalidades agrupadas en diferentes categorías de aplicaciones:

### 1. **Herramientas de Comunicación**
- Discord
- WhatsApp
- AnyDesk

### 2. **Herramientas Multimedia**
- AIMP
- VLC
- Spotify
- PowerToys

### 3. **Herramientas de Desarrollo**
- Visual Studio Code
- Python
- C++ (MinGW)
- Node.js
- Git
- Java (JDK)
- Visual Studio 2019
- Microsoft Office
- FileZilla
- GitHub Desktop
- Notepad++

### 4. **Juegos**
- Lunar Client
- Minecraft Launcher
- Steam
- Epic Games

### 5. **Navegadores**
- Google Chrome
- Mozilla Firefox
- Brave
- Opera GX
- Microsoft Edge

### 6. **Herramientas Útiles**
- 7-Zip
- WinRAR
- OBS Studio
- CPU-Z
- LibreOffice

## Acciones Disponibles

Además de la instalación de aplicaciones, el script también ofrece las siguientes acciones:

- **Instalar Seleccionados:** Instala las aplicaciones seleccionadas utilizando `winget`.
- **Limpiar Archivos Temporales:** Ejecuta un script para limpiar archivos temporales de Windows.
- **Desfragmentar Disco:** Ejecuta un script para desfragmentar el disco duro.
- **Habilitar Alto Rendimiento:** Cambia el plan de energía del sistema a "Alto Rendimiento".
- **Instalar Dependencias de Juegos:** Instala dependencias necesarias para ejecutar ciertos juegos.
- **Instalar WSL (Ubuntu):** Instala Windows Subsystem for Linux con la distribución Ubuntu.
- **Borrar Distro WSL:** Elimina la distribución de WSL (Ubuntu).

## Requisitos

- **PowerShell:** El script debe ejecutarse en un entorno de PowerShell con permisos de administrador.
- **Winget:** El gestor de paquetes de Windows `winget` debe estar instalado y configurado para utilizarse.

## Instrucciones de Uso

1. **Ejecutar el Script como Administrador:**
   - El script automáticamente verifica si tiene privilegios de administrador. Si no los tiene, lo reinicia con los permisos necesarios.

2. **Seleccionar Aplicaciones:**
   - En la ventana de la interfaz, selecciona las aplicaciones que deseas instalar.

3. **Realizar Otras Acciones:**
   - Puedes elegir entre varias acciones como limpiar archivos temporales, desfragmentar el disco o instalar WSL.

4. **Instalar las Aplicaciones:**
   - Haz clic en "Instalar Seleccionados" para instalar las aplicaciones seleccionadas.

## Notas

- Algunos scripts adicionales (`borrartemp.ps1` y `Defragmentar.ps1`) deben estar presentes en el directorio `extras` del script para que ciertas acciones funcionen correctamente.
- El script está diseñado para ser usado principalmente por usuarios avanzados, ya que modifica configuraciones del sistema y realiza instalaciones automáticas de software.

## Contribuciones

Si deseas contribuir al proyecto, siéntete libre de hacer un fork del repositorio y enviar pull requests con mejoras o correcciones. Asegúrate de probar tus cambios antes de enviar el pull request.

## Licencia

Este proyecto está bajo la licencia **Creative Commons Zero v1.0 Universal (CC0 1.0)**. Puedes copiar, modificar, distribuir y realizar cualquier actividad con el trabajo, incluso con fines comerciales, sin necesidad de pedir permiso.

