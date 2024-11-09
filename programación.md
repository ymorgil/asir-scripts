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

>### <span style="color:#00adef;">1. Estructura Condicional `if` </span >

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
>### <span style="color:#00adef;">  2. Estructura Condicional `case` </span>
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

>### <span style="color:#00adef;">  3. Estructura iterativa (bucle) `for` </span>
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

>### <span style="color:#00adef;">  4. Estructura iterativa (bucle) `while` </span>
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

>### <span style="color:#00adef;">  5. Estructura iterativa (bucle) `until` </span>
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


