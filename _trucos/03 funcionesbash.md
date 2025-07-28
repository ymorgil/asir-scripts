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