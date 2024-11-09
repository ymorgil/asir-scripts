# Bash Cheat Sheet

## Navegación de Directorios
- `pwd` – Muestra la ruta actual.
- `ls` – Lista los archivos y carpetas en el directorio actual.
- `cd <directorio>` – Cambia al directorio especificado.
- `cd ..` – Retrocede un nivel.
- `cd ~` – Cambia al directorio principal del usuario.

## Gestión de Archivos y Directorios
- `touch <archivo>` – Crea un archivo vacío.
- `mkdir <directorio>` – Crea un nuevo directorio.
- `rm <archivo>` – Elimina un archivo.
- `rm -r <directorio>` – Elimina un directorio y su contenido.
- `cp <origen> <destino>` – Copia archivos o directorios.
- `mv <origen> <destino>` – Mueve o renombra archivos o directorios.

## Visualización y Edición de Archivos
- `cat <archivo>` – Muestra el contenido de un archivo.
- `head <archivo>` – Muestra las primeras 10 líneas de un archivo.
- `tail <archivo>` – Muestra las últimas 10 líneas de un archivo.
- `nano <archivo>` – Edita el archivo usando el editor `nano`.

## Redirección y Pipes
- `>` – Redirecciona la salida a un archivo (sobrescribiendo).
  - Ejemplo: `echo "Hello" > archivo.txt`
- `>>` – Redirecciona la salida y añade al final del archivo.
- `<` – Toma la entrada de un archivo.
- `|` – Pasa la salida de un comando como entrada de otro.
  - Ejemplo: `cat archivo.txt | grep "texto"`

## Búsqueda
- `grep <texto> <archivo>` – Busca texto específico dentro de un archivo.
- `find <directorio> -name <nombre>` – Busca archivos o directorios por nombre.
- `locate <nombre>` – Encuentra archivos por nombre (requiere base de datos de archivos).

## Procesamiento de Texto

- `awk` – Herramienta para el procesamiento y análisis de texto en función de patrones.
  - Ejemplos:
    - `awk '{print $1}' archivo.txt` – Imprime la primera columna de cada línea en el archivo.
    - `awk '/patrón/ {print $0}' archivo.txt` – Imprime líneas que contienen el "patrón" en el archivo.
    - `awk -F, '{print $2}' archivo.csv` – Usa `,` como delimitador e imprime la segunda columna en un archivo CSV.

- `cut` – Extrae secciones de cada línea de un archivo o entrada estándar.
  - Ejemplos:
    - `cut -d: -f1 /etc/passwd` – Imprime la primera columna (campos separados por `:`) del archivo `/etc/passwd`.
    - `cut -c1-5 archivo.txt` – Imprime los primeros cinco caracteres de cada línea.
    - `cut -f2 archivo.txt` – Imprime el segundo campo de cada línea (por defecto, los campos están separados por tabulaciones).

- `sed` – Editor de flujo para realizar sustituciones y manipulaciones de texto.
  - Ejemplos:
    - `sed 's/patrón/nuevo_texto/g' archivo.txt` – Sustituye todas las ocurrencias de "patrón" por "nuevo_texto" en cada línea.
    - `sed -n '2,4p' archivo.txt` – Muestra solo las líneas de la 2 a la 4.
    - `sed '/^$/d' archivo.txt` – Elimina las líneas vacías.

## Alias
- `alias nombre='comando'` – Crea un alias para un comando.
  - Ejemplo: `alias ll='ls -la'`
- `unalias nombre` – Elimina un alias.

## Permisos

- `chmod <permisos> <archivo>` – Cambia los permisos de un archivo.
  - Ejemplos:
    - `chmod 755 <archivo>` – Permisos de lectura, escritura y ejecución para el propietario; lectura y ejecución para otros.
    - `chmod +x <archivo>` – Añade permisos de ejecución.
    - `chmod -r <archivo>` – Elimina permisos de lectura.

- `chown <usuario>:<grupo> <archivo>` – Cambia el propietario y/o grupo de un archivo o directorio.
  - Ejemplos:
    - `chown usuario <archivo>` – Cambia el propietario del archivo.
    - `chown usuario:grupo <archivo>` – Cambia el propietario y el grupo del archivo.
    - `chown -R usuario:grupo <directorio>` – Cambia recursivamente el propietario y grupo para todos los archivos dentro del directorio.

- `chgrp <grupo> <archivo>` – Cambia el grupo al que pertenece un archivo.
  - Ejemplos:
    - `chgrp grupo <archivo>` – Cambia el grupo del archivo.
    - `chgrp -R grupo <directorio>` – Cambia recursivamente el grupo de todos los archivos dentro de un directorio.

- `umask <máscara>` – Establece los permisos por defecto para nuevos archivos y directorios.
  - Ejemplos:
    - `umask 022` – Nuevos archivos tendrán permisos `755` y los directorios `644`.
    - `umask 077` – Nuevos archivos y directorios solo tendrán permisos para el propietario.
  - Nota: La umask resta permisos; por ejemplo, una umask de `022` evita que otros tengan permisos de escritura.






## Gestión de Procesos
- `ps` – Muestra una lista de procesos en ejecución.
- `top` – Muestra una lista dinámica de procesos con uso de recursos.
- `kill <PID>` – Termina un proceso con el ID proporcionado.
- `killall <nombre_proceso>` – Termina todos los procesos con el nombre dado.



## Comandos Útiles
- `echo <texto>` – Muestra texto en la terminal.
- `date` – Muestra la fecha y hora actual.
- `clear` – Limpia la terminal.
- `history` – Muestra el historial de comandos ejecutados.
- `whoami` – Muestra el usuario actual.
- `uname -a` – Muestra información del sistema.
- `df -h` – Muestra el uso de disco en el sistema.
- `du -h <archivo/directorio>` – Muestra el tamaño de un archivo o directorio.
- `uptime` – Muestra el tiempo que el sistema ha estado activo.

## Redes
- `ping <dirección>` – Prueba la conectividad con una dirección (IP o URL).
- `ifconfig` – Muestra la configuración de red (Linux y Unix).
- `ip addr` – Alternativa a `ifconfig` en sistemas modernos.
- `curl <URL>` – Realiza solicitudes HTTP y descarga contenido de URLs.
- `wget <URL>` – Descarga archivos desde Internet.
- `ssh usuario@host` – Inicia una conexión SSH a un servidor.
- `scp archivo usuario@host:<ruta>` – Copia un archivo de forma segura a otro equipo.
- `netstat -tuln` – Muestra las conexiones de red activas y puertos en uso.





# Programación Estructurada en Bash

### Secuenciales
Son instrucciones que se ejecutan una tras otra en el orden en que aparecen. 

Ejemplo:
```bash
echo "Comenzando script"
mkdir nuevo_directorio
echo "Directorio creado"


## Variables
- `VARIABLE=valor` – Define una variable.
- `$VARIABLE` – Accede al valor de una variable.
- `export VARIABLE=valor` – Define una variable de entorno.



## Estructuras de Control
- **Condicionales**:
  ```bash
  if [ condición ]; then
      # comandos
  elif [ condición ]; then
      # comandos alternativos
  else
      # comandos alternativos
  fi



  # Estructuras de Programación en Bash

```bash
# Secuenciales: Las instrucciones se ejecutan una tras otra en el orden en que aparecen.
echo "Comenzando script"
mkdir nuevo_directorio
echo "Directorio creado"

# Condicional if: Permite ejecutar comandos si se cumple una condición.
if [ -f archivo.txt ]; then
    echo "El archivo existe."
else
    echo "El archivo no existe."
fi

# Condicional case: Permite ejecutar diferentes bloques de código según el valor de una variable.
read -p "Elige una opción (a/b): " opcion
case $opcion in
    "a")
        echo "Elegiste A"
        ;;
    "b")
        echo "Elegiste B"
        ;;
    *)
        echo "Opción no válida"
        ;;
esac

# Bucle for: Ejecuta un conjunto de comandos repetidamente para cada valor en una lista o rango.
for i in {1..5}; do
    echo "Iteración $i"
done

# Bucle while: Ejecuta un conjunto de comandos mientras una condición sea verdadera.
contador=1
while [ $contador -le 5 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done

# Funciones: Permiten definir bloques de código reutilizables.
saludar() {
    echo "Hola, $1"
}

saludar "Mundo"

