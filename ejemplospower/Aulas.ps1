#Autorización de ejecución de Script en el sistema
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Elevación de los privilegios para que se ejecute como si fuera el administrador del sistema
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $Command = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb RunAs -ArgumentList $Command
        Exit
    }
}

# Menú
Function showmenu {
    Clear-Host
    Write-Host "Menu..."
    Write-Host "1. Cambio de nombre del equipo"
    Write-Host "2. Eliminar aplicaciones bloatware "
    Write-Host "3. Actualizar aplicaciones"
    Write-Host "4. Eliminar programas de la lista del documento programas.txt"
    Write-Host "9. Exit"
}

#Script de cambio de nombre
Function CambioNombre {
    $name = Read-Host "Escribir el nuevo nombre del equipo (SE REINICIA SOLO): sintaxis Aula-PC00, ejemplo 301-PC01"
    Rename-Computer -NewName $name -Restart
}

Function deletebloatware {
    Get-AppxPackage -AllUsers | Remove-AppxPackage
}

Function ActualizarApp {
    winget update --all
}

Function EliminarProgramas {

    <#
    $programas = Get-Content .\programas.txt
    foreach ($i in $programas) {
        winget uninstall *$i* 
        Write-Host "Eliminando $i del sistema"
    }#>
}

# Parte principal del script (MAIN)
showmenu
while (($opc = Read-Host -Prompt "Select an option") -ne "9") {
 
    switch ($opc) {
        1 {
            CambioNombre
            break
        }
        2 {
            deletebloatware
            pause; 
            break
        }
        3 {
            ActualizarApp
            pause;
            break
        }
        4 {
            EliminarProgramas
            pause;
            break
        }
        9 { "Exit"; break }
        default { Write-Host -ForegroundColor white -BackgroundColor red "Opción incorrecta. Por favor selecciona otro número"; pause }
        
    }
 
    showmenu
}