# Guía de Scripting en Bash y PowerShell

---

## Indíce
### - [¿Qué es el Scripting en Bash?](#1-qué-es-el-scripting-en-bash)
### - [Sintaxis Básica de Bash](#2-sintaxis-básica-de-bash)
### - [Comandos Comunes de Bash](#3-comandos-comunes-de-bash)
### - [Introducción al Scripting en PowerShell](#4-introducción-al-scripting-en-powershell)
### - [Sintaxis Básica de PowerShell](#5-sintaxis-básica-de-powershell)
### - [Comandos Comunes de PowerShell](#6-comandos-comunes-de-powershell)
### - [Comparativa entre Bash y PowerShell](#7-comparativa-entre-bash-y-powershell)

---

## 1. ¿Qué es el Scripting en Bash?

El **scripting en Bash** se refiere a la escritura de secuencias de comandos (scripts) en el lenguaje de shell de Bash. Bash es el intérprete de comandos predeterminado en la mayoría de las distribuciones de **Linux** y **Unix**. Los scripts de Bash permiten automatizar tareas repetitivas, administrar sistemas y ejecutar comandos del sistema operativo mediante secuencias programadas.

### Características principales de Bash:
- **Interactividad**: Permite la ejecución de comandos uno por uno.
- **Automatización**: Permite crear scripts para tareas repetitivas.
- **Compatibilidad**: Funciona en sistemas Unix y Linux.
- **Lenguaje de programación**: Bash es un lenguaje de scripting que incluye estructuras de control, variables, funciones y más.

### Uso de Bash en sistemas Linux/Unix:
- Es ampliamente utilizado en servidores para administrar sistemas y realizar tareas de mantenimiento.
- Ideal para la automatización de tareas administrativas como copias de seguridad, actualización de sistemas, etc.

---

## 2. Sintaxis Básica de Bash

### Variables en Bash
Las variables en Bash se definen sin necesidad de especificar su tipo.

```bash
#!/bin/bash
nombre="Juan"
echo "Hola, $nombre!"
```

Para variables de solo lectura:
```bash
readonly PI=3.1416
echo "El valor de PI es $PI"
```

Para eliminar una variable:
```bash
unset nombre
```

## Estructuras de Control

### Condicional `if`
```bash
#!/bin/bash
num=10
if [ $num -gt 5 ]; then
    echo "El número es mayor que 5"
else
    echo "El número es 5 o menor"
fi
```

### `case` (Switch en otros lenguajes)
```bash
#!/bin/bash
echo "Ingrese un número: "
read num
case $num in
    1) echo "Elegiste uno";;
    2) echo "Elegiste dos";;
    *) echo "Opción no válida";;
esac
```

## Bucles en Bash

### Bucle `for`
```bash
#!/bin/bash
for i in {1..5}; do
    echo "Número: $i"
done
```

### Bucle `while`
```bash
#!/bin/bash
contador=1
while [ $contador -le 5 ]; do
    echo "Iteración $contador"
    ((contador++))
done
```

### Bucle `until`
```bash
#!/bin/bash
contador=1
until [ $contador -gt 5 ]; do
    echo "Iteración $contador"
    ((contador++))
done
```

## Funciones en Bash

```bash
#!/bin/bash
mi_funcion() {
    echo "Hola desde la función!"
}
mi_funcion
```

### Función con parámetros
```bash
#!/bin/bash
suma() {
    resultado=$(( $1 + $2 ))
    echo "La suma es: $resultado"
}
suma 5 7
```

### Función con retorno de valor
```bash
#!/bin/bash
multiplica() {
    echo $(( $1 * $2 ))
}
resultado=$(multiplica 3 4)
echo "El resultado de la multiplicación es: $resultado"
```

---

## 3. Comandos comunes de Bash

### `ls` - Listar archivos y directorios
```bash
ls          # Lista archivos y directorios
ls -l       # Lista con detalles
ls -a       # Muestra archivos ocultos
```

### `cd` - Cambiar de directorio
```bash
cd /ruta/destino   # Cambia al directorio especificado
cd ..              # Sube un nivel
cd ~               # Va al directorio home
```

### `echo` - Imprimir texto en la terminal
```bash
echo "Hola, mundo"   # Muestra el mensaje
```

### `grep` - Buscar patrones en archivos
```bash
grep "texto" archivo.txt   # Busca "texto" en archivo.txt
grep -i "texto" archivo.txt # Búsqueda sin distinguir mayúsculas/minúsculas
```

### `pwd` - Mostrar directorio actual
```bash
pwd  # Muestra la ruta completa del directorio actual
```

### `mkdir` - Crear un directorio
```bash
mkdir nuevo_directorio   # Crea un directorio nuevo
```

### `rm` - Eliminar archivos o directorios
```bash
rm archivo.txt        # Elimina un archivo
rm -r directorio/     # Elimina un directorio y su contenido
```

### `cp` - Copiar archivos o directorios
```bash
cp archivo.txt /ruta/destino   # Copia un archivo
cp -r carpeta/ /ruta/destino   # Copia un directorio
```

### `mv` - Mover o renombrar archivos
```bash
mv archivo.txt /ruta/destino   # Mueve un archivo
mv viejo_nombre.txt nuevo_nombre.txt  # Renombra un archivo
```

### `cat` - Mostrar contenido de archivos
```bash
cat archivo.txt   # Muestra el contenido del archivo
```

### `find` - Buscar archivos
```bash
find /ruta -name "archivo.txt"   # Busca archivo.txt en /ruta
```

---

## 4. Introducción al Scripting en PowerShell

### ¿Qué es PowerShell?
PowerShell es un lenguaje de scripting y una interfaz de línea de comandos desarrollado por Microsoft. Se basa en .NET y permite automatizar tareas del sistema, administrar configuraciones y ejecutar comandos de manera eficiente.

### Sistemas operativos compatibles
PowerShell está disponible en:
- **Windows** (preinstalado desde Windows 7 y Server 2008 R2)
- **Linux** (mediante PowerShell Core)
- **macOS** (mediante PowerShell Core)

### Características principales
- **Basado en objetos**: A diferencia de otros intérpretes de comandos, PowerShell maneja objetos en lugar de texto.
- **Cmdlets**: Comandos especializados para realizar tareas específicas.
- **Automatización**: Permite la creación de scripts avanzados para gestionar sistemas y redes.
- **Integración con .NET**: Facilita la extensibilidad y el acceso a recursos del sistema.
- **Remoting**: Ejecuta comandos en máquinas remotas de manera segura.

---

## 5. Sintaxis Básica de PowerShell

### Variables
Las variables en PowerShell se definen con el prefijo `$`.
```powershell
$nombre = "Juan"
$edad = 30
Write-Output "Nombre: $nombre, Edad: $edad"
```

## Estructuras de Control

### Condicional `if-else`
```powershell
$numero = 10
if ($numero -gt 5) {
    Write-Output "El número es mayor que 5"
} else {
    Write-Output "El número es 5 o menor"
}
```

### Bucle `for`
```powershell
for ($i = 1; $i -le 5; $i++) {
    Write-Output "Iteración $i"
}
```

### Bucle `while`
```powershell
$contador = 1
while ($contador -le 3) {
    Write-Output "Contador: $contador"
    $contador++
}
```

## Funciones
Las funciones en PowerShell se definen con **function**.

```powershell
function Saludar {
    param([string]$nombre)
    Write-Output "Hola, $nombre!"
}
Saludar "Carlos"
```

---

## 6. Comandos Comunes de PowerShell

PowerShell es una potente herramienta de línea de comandos que permite administrar sistemas y automatizar tareas. A continuación, se presentan algunos de los comandos más utilizados en PowerShell junto con ejemplos prácticos de cómo se usan.

### **Get-Command**
El comando `Get-Command` se utiliza para obtener una lista de todos los cmdlets, funciones y alias disponibles en PowerShell.

### Ejemplo:
```powershell
Get-Command *proceso*
```

### **Set-Item**
El comando Set-Item se utiliza para cambiar el valor de un elemento, como un archivo, una carpeta o una variable.

```powershell
#Este comando cambiará el contenido de "archivo.txt" al texto "Nuevo contenido del archivo"
Set-Item -Path "C:\\Mis Archivos\\archivo.txt" -Value "Nuevo contenido del archivo"

#Este comando cambiará el valor de la variable $miVariable a "Nuevo valor"
$miVariable = "Valor inicial"
Set-Item -Path Variable:\\miVariable -Value "Nuevo valor"
```

### **Get-Help**
El comando Get-Help se utiliza para obtener información detallada sobre cualquier cmdlet, función o comando en PowerShell.

```powershell
Get-Help Get-Command    #Mostrará detalles de cómo usar el cmdlet Get-Command
Get-Help Get-Command -Examples    #Mostrará ejemplos de uso del cmdlet
```

### **Get-Item**
El comando Get-Item se utiliza para obtener información sobre un archivo, carpeta o registro.

```powershell
Get-Item -Path "C:\\Mis Archivos\\archivo.txt"
```

### **Set-Location**
El comando Set-Location se utiliza para cambiar el directorio actual.

```powershell
Set-Location -Path "C:\\Mis Archivos"
```

### **Get-Process**
El comando Get-Process se utiliza para obtener información sobre los procesos que se están ejecutando en el sistema.

```powershell
Get-Process    #General

Get-Process -Name "notepad"    #Un proceso específico
```

### **Stop-Process**
El comando Stop-Process se utiliza para detener un proceso en ejecución.

```powershell
Stop-Process -Name "notepad"
```

### **Get-Service**
El comando Get-Service se utiliza para obtener información sobre los servicios de Windows que están instalados en el sistema.

```powershell
Get-Service    #General

Get-Service -Name "wuauserv"    #Un servicio específico
```

### **Start-Service**
El comando Start-Service se utiliza para iniciar un servicio detenido.

```powershell
Start-Service -Name "wuauserv"
```

### **New-Item**
El comando New-Item se utiliza para crear nuevos archivos o carpetas.

```powershell
New-Item -Path "C:\\Mis Archivos" -Name "NuevoArchivo.txt" -ItemType "File"    #Archivo
New-Item -Path "C:\\Mis Archivos" -Name "NuevaCarpeta" -ItemType "Directory"    #Carpeta
```

---

## 7. Comparativa entre Bash y PowerShell
A continuación se muestra una breve comparación entre Bash y PowerShell, destacando las principales diferencias y similitudes.

| Característica                | **Bash**                                          | **PowerShell**                                    |
| ----------------------------- | ------------------------------------------------ | ------------------------------------------------ |
| **Sistema operativo principal** | Principalmente Linux y macOS, pero también en Windows con WSL | Principalmente Windows, pero también disponible en Linux y macOS |
| **Paradigma de programación**  | Basado en comandos y scripts, estilo UNIX        | Basado en objetos y scripting, más orientado a .NET |
| **Sintaxis**                   | Simples comandos textuales y scripts de shell    | Sintaxis basada en cmdlets y objetos              |
| **Manipulación de texto**      | Manipulación de texto simple con herramientas como `awk`, `sed`, etc. | Manipulación de texto con objetos y cmdlets como `Select-String` |
| **Comandos**                   | Utiliza comandos tradicionales de Unix/Linux (ls, cat, grep, etc.) | Utiliza cmdlets, que son comandos estructurados como `Get-Command` |
| **Tipo de datos**              | Maneja cadenas y variables básicas               | Maneja objetos completos, incluidos tipos complejos como arrays y tablas |
| **Pipe (tuberías)**            | Los pipes pasan texto entre los comandos         | Los pipes pasan objetos entre cmdlets             |
| **Compatibilidad**             | Compatible con la mayoría de herramientas UNIX/Linux | Alta compatibilidad con el ecosistema de Windows y cmdlets .NET |
| **Redirección**                | Redirección de salida estándar con `>` y `>>`    | Redirección usando `Out-File`, `Out-String` y otros cmdlets |
| **Automatización de tareas**   | Utiliza scripts sencillos y herramientas externas para la automatización | Potente motor de scripting orientado a tareas de administración de sistemas |
| **Interactividad**             | Terminal de línea de comandos tradicional         | Consola interactiva con soporte para comandos y objetos |
| **Extensibilidad**             | Ampliable con scripts y herramientas de terceros | Extensible con módulos adicionales, soporte para extensiones en .NET |
| **Orientación**                | Orientado a tareas de administración y scripting en sistemas basados en UNIX | Orientado a la administración de sistemas, especialmente en entornos Windows |
| **Ejemplo de comando básico**  | `ls -l` para listar archivos en directorio       | `Get-ChildItem` para listar archivos en directorio |

### Conclusión
- **Bash** es más adecuado para tareas en sistemas Unix/Linux y aquellos que prefieren la simplicidad y la velocidad.
- **PowerShell** es más adecuado para usuarios de Windows o aquellos que trabajan en entornos de administración de sistemas complejos y necesitan trabajar con objetos y un ecosistema .NET.
