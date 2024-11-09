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

### 1. Estructura Condicional `if`

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


```bash
numero=10
if [ $numero -gt 5 ]; then
    echo "El número es mayor que 5"
else
    echo "El número es menor o igual que 5"
fi
```


# Estructuras de Programación en Bash

```bash
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

```
