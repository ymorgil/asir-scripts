# Programación Estructurada en Bash

## 🧾 Variables

Las variables en Bash se utilizan para almacenar información que se puede utilizar más adelante en el script. No es necesario declarar el tipo de una variable, solo se asigna un valor.

- `VARIABLE=valor` – Define una variable.
- `$VARIABLE` – Accede al valor de una variable.
- `export VARIABLE=valor` – Define una variable de entorno.

Ejemplo:

```bash
VAR=valor        # 💾 Asignar variable
echo $VAR        # 📢 Mostrar variable
read VAR         # 🎤 Leer entrada del usuario

nombre="Juan"
echo "Hola, $nombre"
```

## 🐚 Secuenciales

Son instrucciones que se ejecutan una tras otra en el orden en que aparecen.

Ejemplo:

```bash
echo "Comenzando script"
mkdir nuevo_directorio
echo "Directorio creado"
```

## ❓ Condicionales

> ### Estructura Condicional `if`

La estructura `if` permite ejecutar un bloque de comandos si se cumple una condición. Para esa condición se sueles usar:

1. Simples corchetes [ ... ]:

   - Se utilizan para evaluar expresiones condicionales simples son más antiguos y se basan en el comando **test**.
   - Limitados en cuanto a operadores de comparación y no permiten trabajar con cadenas que contienen espacios sin comillas.
   - No permiten operaciones de comparación de cadenas con patrones (como == o != con **wildcards**).

2. Dobles corchetes [[...]]:
   - Permiten el uso de operadores lógicos más avanzados, como &&, || y !.
   - Son más tolerantes con las cadenas que contienen espacios, ya que no requieren que las variables se citen explícitamente en muchos casos.
   - Soportan comparaciones de cadenas con patrones, como == y !=, y permiten el uso de comodines (\*, ?).
3. Operadores comunes: (Ver sección operadores y wildcards)
    ```bash
    [ "$a" = "$b" ]     # 📏 Igualdad de cadenas
    [ "$a" -eq "$b" ]   # 🔢 Igualdad numérica
    [ -f FILE ]         # 📄 Es un archivo
    [ -d DIR ]          # 📁 Es un directorio
    [ -z "$STR" ]       # 🈳 Cadena vacía
    ```

#### Sintaxis

```bash
  if [[ condición ]]; then
      # comandos
  elif [[ condición ]]; then
      # comandos alternativos
  else
      # comandos alternativos
  fi
```

#### Ejemplo

```bash
numero=10
if [ $numero -gt 5 ]; then
    echo "El número es mayor que 5"
else
    echo "El número es menor o igual que 5"
fi
```

> ### Estructura Condicional `case`

El case se utiliza cuando se desea evaluar múltiples opciones posibles para una variable. Es útil cuando se tienen muchas condiciones que verificar.

#### Sintaxis

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

#### Ejemplo

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

## 🔁Estructuras iterativa (bucles)

Permite repetir un conjunto de comandos varias veces, según una condición o una lista de valores. Se usan cuando quieres automatizar tareas repetitivas sin escribir el mismo código una y otra vez.

> ### Estructura iterativa `for`

🔹 Recorre una lista o secuencia de valores.

✔️ Úsalo cuando sabes cuántas veces vas a repetir algo o tienes una lista definida.

#### Sintaxis

```bash
for variable in {inicio..fin}; do
    # comandos
done
```

#### Ejemplo

```bash
for i in {1..5}; do
    echo "Iteración $i"
done
# Este bucle imprimirá "Iteración 1", "Iteración 2", hasta "Iteración 5".
```

```bash
for archivo in *.txt; do
  echo "Procesando $archivo"
done
```

> ### Estructura iterativa `while` 

🔹 Repite mientras una condición sea verdadera.

✔️ Úsalo cuando no sabes cuántas veces se repetirá y depende de una condición que puede cambiar durante la ejecución.

#### Sintaxis

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
    contador=$((contador + 1))  # ((contador++))
done
#Este bucle seguirá ejecutándose mientras la condición sea verdadera. En este caso, imprimirá los valores del contador del 1 al 3.
```

```bash
while IFS= read -r linea; do
    echo "Línea: $linea"
done < archivo.txt

# El bucle while es comúnmente utilizado para leer archivos línea por línea, especialmente cuando no sabes cuántas líneas tiene el archivo o cuando necesitas realizar operaciones dinámicas en cada línea.

# Recuerda usar `IFS` y `-r` para una lectura más robusta si las líneas contienen espacios o caracteres especiales.
```

> ### Estructura iterativa `until`

🔹 Repite hasta que una condición sea verdadera (lo opuesto a while).

✔️ Úsalo cuando quieres repetir algo hasta que ocurra una condición.

#### Sintaxis

```bash
until [ condición ]; do
    # comandos
done
```

#### Ejemplo

```bash
contador=1
until [ $contador -gt 3 ]; do
    echo "Contador: $contador"
    contador=$((contador + 1)) # ((contador++))
done
# Este bucle continuará ejecutándose hasta que la condición se haga verdadera (cuando el contador sea mayor que 3)
```

## 📦 Operadores y wildcards

> ### 🔢 Tabla de Operadores Lógicos en Bash

| Operador     | Descripción                                |
|--------------|---------------------------------------------|
| `-lt` (<)    | less than (menor que)                       |
| `-gt` (>)    | greater than (mayor que)                    |
| `-le` (<=)   | less or equal than (menor o igual que)      |
| `-ge` (>=)   | greater or equal than (mayor o igual que)   |
| `-eq` (==)   | equal (igual)                               |
| `-ne` (!=)   | not equal (distinto)                        |
| `-n`         | not null (el valor contiene al menos 1 carácter) |
| `-z`         | null (el valor no contiene ningún carácter) |

> ### 📁 Operadores Condicionales de Ficheros en Bash

| Operador | Descripción                                                  |
|----------|--------------------------------------------------------------|
| `-e`     | Verifica si existe el fichero o directorio                   |
| `-f`     | Verifica si existe el fichero **y NO es** un directorio      |
| `-s`     | Verifica si el fichero existe **y no está vacío**            |
| `-d`     | Verifica si **es un directorio**                             |
| `-r`     | Verifica si el fichero/directorio tiene **permisos de lectura** |
| `-w`     | Verifica si tiene **permisos de escritura**                  |
| `-x`     | Verifica si tiene **permisos de ejecución**                  |

> ### 📎 Tabla de Wildcards en Bash

| Comodín | Significado                                 | Ejemplo             | Coincidencias típicas             |
|---------|---------------------------------------------|---------------------|-----------------------------------|
| `*`     | Cualquier cantidad de caracteres (incluido ninguno) | `*.txt`             | `nota.txt`, `resumen.txt`, etc.   |
| `?`     | Un solo carácter (cualquiera)               | `archivo?.log`      | `archivo1.log`, `archivoA.log`    |
| `[abc]` | Un solo carácter que sea `a`, `b` o `c`     | `file[123].txt`     | `file1.txt`, `file2.txt`, etc.    |
| `[a-z]` | Un solo carácter en ese rango               | `letra[a-z].sh`     | `letraa.sh`, `letrab.sh`, etc.    |
| `[!abc]` o `[^abc]` | Cualquier carácter excepto `a`, `b` o `c` | `file[!0-9].txt`     | `filea.txt`, `file_.txt`, etc.    |
| `{uno,dos}` | Expansión de lista, separado por comas  | `echo {uno,dos}`    | `uno dos` (expande ambas opciones)|
| `{1..3}` | Expansión de rango numérico o alfabético   | `file{1..3}.txt`    | `file1.txt`, `file2.txt`, `file3.txt` |
| `**`    | Recursivo (si `shopt -s globstar`)          | `**/*.txt`          | Todos los `.txt` en subdirectorios |

> 🔧 **Nota**: La expansión `**` solo funciona si activas `globstar`:
```bash
shopt -s globstar
