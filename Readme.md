# Resumen de BASH   ![Bash](https://img.shields.io/badge/Bash-%2312100E.svg?style=flat-square&logo=gnu-bash&logoColor=white)

1. [Comandos](#comandos)
2. [Programación Estructurada en Bash](#programación-estructurada-en-bash)
    1. [Estructura Condicional `if`](#estructura-condicional-if) 
    2. [Estructura Condicional `case`](#estructura-condicional-case) 
    3. [Estructura iterativa bucle `for`](#estructura-iterativa-bucle-for) 
    4. [Estructura iterativa bucle `while`](#estructura-iterativa-bucle-while) 
    5. [Estructura iterativa bucle `until`](#estructura-iterativa-bucle-until) 
3. [Funciones en Bash](#funciones-en-bash)

<br><br>

# Comandos  

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

## Redes
- `ping <dirección>` – Prueba la conectividad con una dirección (IP o URL).
- `ifconfig` – Muestra la configuración de red (Linux y Unix).
- `ip addr` – Alternativa a `ifconfig` en sistemas modernos.
- `curl <URL>` – Realiza solicitudes HTTP y descarga contenido de URLs.
- `wget <URL>` – Descarga archivos desde Internet.
- `ssh usuario@host` – Inicia una conexión SSH a un servidor.
- `scp archivo usuario@host:<ruta>` – Copia un archivo de forma segura a otro equipo.
- `netstat -tuln` – Muestra las conexiones de red activas y puertos en uso.

## Gestión de Procesos
- `ps` – Muestra una lista de procesos en ejecución.
- `top` – Muestra una lista dinámica de procesos con uso de recursos.
- `kill <PID>` – Termina un proceso con el ID proporcionado.
- `killall <nombre_proceso>` – Termina todos los procesos con el nombre dado.

<br><br>


# Programación Estructurada en Bash
## Variables en Bash
Las variables en Bash se utilizan para almacenar información que se puede utilizar más adelante en el script. No es necesario declarar el tipo de una variable, solo se asigna un valor.
- `VARIABLE=valor` – Define una variable.
- `$VARIABLE` – Accede al valor de una variable.
- `export VARIABLE=valor` – Define una variable de entorno.

### Ejemplo:
```bash
nombre="Juan"
echo "Hola, $nombre"
```

## Secuenciales
Son instrucciones que se ejecutan una tras otra en el orden en que aparecen. 

Ejemplo:
```bash
echo "Comenzando script"
mkdir nuevo_directorio
echo "Directorio creado"
```

## Estructuras de Control

>### <span style="color:#00adef;">Estructura Condicional `if` </span >

La estructura `if` permite ejecutar un bloque de comandos si se cumple una condición. Para esa condición se sueles usar:
1. Simples corchetes [ ... ]:
   - Se utilizan para evaluar expresiones condicionales simples son más antiguos y se basan en el comando **test**.
   - Limitados en cuanto a operadores de comparación y no permiten trabajar con cadenas que contienen espacios sin comillas.
   - No permiten operaciones de comparación de cadenas con patrones (como == o != con **wildcards**).

2. Dobles corchetes [[ ... ]]:
   - Permiten el uso de operadores lógicos más avanzados, como &&, || y !.
   - Son más tolerantes con las cadenas que contienen espacios, ya que no requieren que las variables se citen explícitamente en muchos casos.
   - Soportan comparaciones de cadenas con patrones, como == y !=, y permiten el uso de comodines (*, ?).

#### Sintaxis:
```bash
if [[ condición ]]; then
    # comandos si la condición es verdadera
else
    # comandos si la condición es falsa
fi
```
```bash
  if [ condición ]; then
      # comandos
  elif [ condición ]; then
      # comandos alternativos
  else
      # comandos alternativos
  fi
```

#### Ejemplo:
```bash
numero=10
if [ $numero -gt 5 ]; then
    echo "El número es mayor que 5"
else
    echo "El número es menor o igual que 5"
fi
```
>### <span style="color:#00adef;">  Estructura Condicional `case` </span>
El case se utiliza cuando se desea evaluar múltiples opciones posibles para una variable. Es útil cuando se tienen muchas condiciones que verificar.

#### Sintaxis:
```bash
case $variable in
    valor1)
        # comandos si la variable es igual a valor1
        ;;
    valor2)
        # comandos si la variable es igual a valor2
        ;;
    *)
        # comandos si ninguna opción coincide
        ;;
esac
```

#### Ejemplo:
```bash
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
``` 
En este ejemplo, dependiendo del valor de opcion, se ejecuta un bloque de código específico.

>### <span style="color:#00adef;">Estructura iterativa (bucle) `for` </span>
El bucle for ejecuta un conjunto de comandos un número **determinado** de veces.
#### Sintaxis:
```bash
for variable in {inicio..fin}; do
    # comandos
done
```

#### Ejemplo:
```bash
for i in {1..5}; do
    echo "Iteración $i"
done
```
Este bucle imprimirá "Iteración 1", "Iteración 2", hasta "Iteración 5".

>### <span style="color:#00adef;"> Estructura iterativa (bucle) `while` </span>
El bucle while repite un conjunto de comandos mientras se cumpla una condición.
#### Sintaxis:
```bash
while [ condición ]; do
    # comandos
done
```

#### Ejemplo:
```bash
contador=1
while [ $contador -le 3 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done
```
Este bucle seguirá ejecutándose mientras la condición sea verdadera. En este caso, imprimirá los valores del contador del 1 al 3.

>#### <span style="color:#aaee88;"> Lectura de ficheros </span>
El bucle while es comúnmente utilizado para leer archivos línea por línea, especialmente cuando no sabes cuántas líneas tiene el archivo o cuando necesitas realizar operaciones dinámicas en cada línea.
- Recuerda usar `IFS` y `-r` para una lectura más robusta si las líneas contienen espacios o caracteres especiales.
```bash
while IFS= read -r linea; do
    echo "Línea: $linea"
done < archivo.txt
```

>### <span style="color:#00adef;">  Estructura iterativa (bucle) `until` </span>
El bucle until es similar al while, pero en lugar de ejecutar el bloque de comandos mientras la condición sea verdadera, lo hace mientras la condición sea falsa.

#### Sintaxis:
```bash
until [ condición ]; do
    # comandos
done
```

#### Ejemplo:
```bash
contador=1
until [ $contador -gt 3 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1))
done
```
Este bucle continuará ejecutándose hasta que la condición se haga verdadera (cuando el contador sea mayor que 3)

<br><br>

# Funciones en Bash
Las funciones en Bash permiten agrupar un conjunto de comandos bajo un mismo nombre para poder reutilizarlos en diferentes partes de un script. Esto ayuda a organizar el código, evitar repeticiones y facilitar su mantenimiento.

## Definición de una función

Para definir una función en Bash, se utiliza la siguiente sintaxis:
```bash
nombre_funcion() {
    # Comandos que realiza la función
}
```
```bash
mi_funcion() {
    echo "Hola desde la función"
}
```
Una vez definida la función, puedes llamarla en cualquier lugar del script simplemente escribiendo su nombre:
```bash
mi_funcion
```
La salida de este script será:
- Hola desde la función


## Parámetros
Puedes pasar parámetros a una función al momento de llamarla. Los parámetros se acceden dentro de la función a través de $1, $2, $3, etc., que representan el primer, segundo y tercer parámetro, respectivamente.
Ejemplo con parámetros:
```bash
saludar() {
    echo "Hola, $1"
}
```
```bash
saludar "Juan"
```
En este ejemplo, la función saludar toma un argumento (en este caso, el nombre "Juan") y lo imprime con un mensaje. La salida sería:
- Hola, Juan

