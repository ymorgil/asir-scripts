# Definición de funciones
function Actualizar-Windows {
    Write-Host "Iniciando actualización de Windows..."
    Install-Module PSWindowsUpdate -Force -Confirm:$false
    # Importa el módulo PSWindowsUpdate
    Import-Module PSWindowsUpdate
    # Forzar la búsqueda e instalación de actualizaciones disponibles
    Write-Host "Instalando las actualizaciones disponibles..."
    Get-WindowsUpdate -AcceptAll -Install -AutoReboot
    Write-Host "Actualización completada."
    #Mostrar versión
    $build = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name "CurrentBuildNumber"
    $ubr = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -Name "UBR"
    Write-Host "Compilación actual: $($build.CurrentBuildNumber).$($ubr.UBR)"
}

function Limpiar-Sistema {
    Write-Host "Iniciando limpieza del sistema..."
    # Define las rutas de las carpetas
    $downloadsFolder = [System.Environment]::GetFolderPath('UserProfile') + "\Downloads"
    $tempFolder = [System.Environment]::GetFolderPath('LocalApplicationData') + "\Temp"
    # Elimina los archivos en la carpeta de descargas
    Write-Host "Eliminando archivos en la carpeta de descargas..."
    Remove-Item -Path "$downloadsFolder\*" -Force -Recurse -ErrorAction SilentlyContinue
    # Elimina los archivos temporales
    Write-Host "Eliminando archivos temporales..."
    Remove-Item -Path "$tempFolder\*" -Force -Recurse -ErrorAction SilentlyContinue
    # Ejecuta la limpieza de disco usando la configuración guardada con sageset:1
    Write-Host "Ejecutando limpieza de disco..."
    cleanmgr /sagerun:1
    # Limpiar la caché de Firefox
    Write-Host "Limpiando la caché de Firefox..."
    $firefoxCache = "$env:APPDATA\..\Local\Mozilla\Firefox\Profiles\*.default-release\cache2"
    if (Test-Path $firefoxCache) {
        Remove-Item -Path "$firefoxCache\*" -Force -Recurse -ErrorAction SilentlyContinue
    } else {
        Write-Host "No se encontró caché de Firefox para limpiar."
    }
    Write-Host "Limpieza completada."
}

function Verificar-Administrador {
    $currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($currentIdentity)
    if ($principal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "El script se ejecuta como administrador."
    } else {
        Write-Host "El script necesita permisos de administrador." -ForegroundColor Red
        exit
    }
}

function Actualizar-Apps {
    # Ejecutar el comando para actualizar todas las aplicaciones
    Write-Host "Buscando actualizaciones y actualizando todas las aplicaciones instaladas..." -ForegroundColor Yellow
    winget upgrade --all --accept-source-agreements --accept-package-agreements
    Write-Host "Todas las aplicaciones han sido actualizadas correctamente." -ForegroundColor Green


}

# Menú y selección
Write-Host "Seleccione una opción:"
Write-Host "1. Verificar privilegios de administrador"
Write-Host "2. Limpiar el sistema"
Write-Host "3. Actualizar Windows"
Write-Host "4. Actualizar-Apps"
Write-Host "5. Salir"

$opcion = Read-Host "Ingrese su elección (1-5)"

# Usar switch para llamar a la función correspondiente
switch ($opcion) {
    1 { Verificar-AdministradorActualizar-Apps }
    2 { Limpiar-Sistema }
    3 { Actualizar-Windows }
    4 { Actualizar-Apps }
    5 { Write-Host "Saliendo del script..."; exit }
    Default { Write-Host "Opción no válida. Intente nuevamente." }
}
