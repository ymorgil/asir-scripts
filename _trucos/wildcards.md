# Wildcards en Bash

    Asterisco *: Coincide con cero o más caracteres en una cadena.
        Uso: Puede coincidir con cualquier número de caracteres (incluyendo ninguno).
        Ejemplo:

    echo *.txt

    Este comando muestra todos los archivos que terminan con .txt en el directorio actual.

Signo de interrogación ?: Coincide con un solo carácter.

    Uso: Reemplaza exactamente un carácter en la cadena.
    Ejemplo:

    echo file?.txt

    Esto coincidiría con archivos como file1.txt, fileA.txt, pero no con file.txt.

Corchetes []: Coincide con uno de los caracteres dentro del conjunto de corchetes.

    Uso: Permite especificar un conjunto de caracteres posibles para esa posición.

    Ejemplo:

echo file[1-3].txt

Esto coincidiría con file1.txt, file2.txt y file3.txt.

También puedes usar rangos o listas explícitas:

    echo file[a-d].txt

    Esto coincidiría con filea.txt, fileb.txt, filec.txt, y filed.txt.

Caret ^ o ! dentro de los corchetes: Niega el conjunto de caracteres.

    Uso: Coincide con cualquier carácter que no esté dentro de los corchetes.
    Ejemplo:

    echo file[!a-z].txt

    Esto coincidiría con file!.txt, file#.txt, pero no con filea.txt.

Asterisco dentro de corchetes [*]: Coincide con el carácter asterisco literalmente, no como un comodín.

    Uso: Si quieres incluir un asterisco como un carácter normal en lugar de un comodín.
    Ejemplo:

    echo "file[*].txt"

    Esto coincidiría literalmente con el archivo file[*].txt.

Rango dentro de corchetes -: Define un rango de caracteres, como números o letras.

    Uso: Coincide con cualquier carácter dentro del rango especificado.

    Ejemplo:

echo file[0-9].txt

Esto coincidiría con archivos como file0.txt, file1.txt, file9.txt.

También puedes usar rangos de letras:

        echo file[a-z].txt

        Coincidiría con filea.txt, fileb.txt, etc., hasta filez.txt.

Ejemplos de uso en Bash:

    Buscar todos los archivos .txt en un directorio:

ls *.txt

Buscar archivos que empiecen con "log" y terminen con ".txt":

ls log*.txt

Buscar archivos que tengan un solo carácter después de "file":

ls file?.txt

Buscar archivos con nombres que contengan letras mayúsculas:

ls [A-Z]*.txt

Excluir archivos que tengan caracteres numéricos al final:

ls *[!0-9].txt

Coincidir con cualquier archivo que tenga uno o más caracteres entre "a" y "d" en su nombre:

    ls file[a-d]*.txt

Resumen de los Wildcards:

    *: Coincide con cero o más caracteres.
    ?: Coincide con un solo carácter.
    [ ]: Coincide con un solo carácter dentro de los corchetes.
    [! ] o [^ ]: Niega el conjunto de caracteres en los corchetes.
    [a-z]: Coincide con cualquier carácter dentro del rango de letras o números.

Los comodines son muy poderosos para realizar búsquedas y manipulaciones de archivos en Bash, lo que facilita trabajar con conjuntos de archivos o patrones complejos sin tener que especificar cada archivo individualmente.