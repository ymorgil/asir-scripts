crear(){
   # Variables iniciales
   nombre="fichero_vacio"
   tamano="1024"
   # ACtualizao variables si me pasan valores por parámetros
   if [ ! -z $1 ]; then nombre=$1; fi
   if [ ! -z $2 ]; then tamano=$2; fi
   # Creación del archivo
   truncate -s "${tamano}K"  $nombre
}