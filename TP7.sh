#!/bin/bash
# Trabajo Practico Nº 7

# Ubicacion de trabajo
mkdir -p ~/documentos/practicas/tp7
cd ~/documentos/practicas/tp7 || exit

# ------------------ Punto 6 ------------------
echo "---------------- Punto 6 ----------------"
# Calcula tamaño de archivos y directorios, y cuenta cuántos hay
dir="$1"
if [ -z "$dir" ] || [ ! -d "$dir" ]; then
    echo "Indique un directorio como parametro"
else
    total_archivos=0
    total_directorios=0
    echo "Tamaños de archivos y directorios en $dir:"
    for f in "$dir"/*; do
        tamaño=$(du -sh "$f" | awk '{print $1}')
        echo "$f -> $tamaño"
        [ -f "$f" ] && ((total_archivos++))
        [ -d "$f" ] && ((total_directorios++))
    done
    echo "Cantidad de archivos ordinarios: $total_archivos"
    echo "Cantidad de directorios: $total_directorios"
fi

# ------------------ Punto 7 ------------------
echo "---------------- Punto 7 ----------------"
# Tipos de particiones y tamaños (fdisk)
echo "Informe de particiones de disco:"
sudo fdisk -l | grep '^/dev/' | awk '{print $1, $5/1024/1024 " MB", $6}'

# ------------------ Punto 8 ------------------
echo "---------------- Punto 8 ----------------"
# Borrar mp3 y mover archivos 744 a carpeta exe
dir="$1"
if [ -z "$dir" ] || [ ! -d "$dir" ]; then
    echo "Indique un directorio como parametro"
else
    mkdir -p "$dir/exe"
    # Borra *.mp3
    find "$dir" -type f -name "*.mp3" -exec rm -f {} \;
    # Mueve archivos con permiso 744
    find "$dir" -type f -perm 744 -exec mv {} "$dir/exe/" \;
    echo "Archivos *.mp3 eliminados y archivos 744 movidos a $dir/exe"
fi

# ------------------ Punto 9 ------------------
echo "---------------- Punto 9 ----------------"
# Devuelve el archivo mas grande y su tamaño
dir="$1"
if [ -z "$dir" ] || [ ! -d "$dir" ]; then
    echo "Indique un directorio como parametro"
else
    archivo_grande=$(find "$dir" -type f -exec du -b {} + | sort -nr | head -1)
    tamaño=$(echo "$archivo_grande" | awk '{print $1}')
    nombre=$(echo "$archivo_grande" | awk '{print $2}')
    echo "Archivo más grande: $nombre -> $tamaño bytes"
fi

# ------------------ Punto 10 ------------------
echo "---------------- Punto 10 ----------------"
# Muestra la particion principal en Kbytes
part_principal=$(df / | tail -1)
echo "Partición principal:"
echo "$part_principal" | awk '{print "Sistema de archivos: "$1"\nTamaño (KB): "$2"\nUsado (KB): "$3"\nDisponible (KB): "$4}'

# ------------------ Punto 11 ------------------
echo "---------------- Punto 11 ----------------"
# Crear enlaces simbolicos
mkdir -p ~/documentos/practicas/tp7/edirectory
mkdir -p ~/documentos/practicas/tp7/efiler
practicas_dir=~/documentos/practicas
for d in "$practicas_dir"/*/; do
    [ -d "$d" ] && ln -s "$d" ~/documentos/practicas/tp7/edirectory/$(basename "$d")
done
# Enlaces a ejercicios 1 y 2 de TP2
if [ -d "$practicas_dir/TP2" ]; then
    ln -s "$practicas_dir/TP2/ejercicio1" ~/documentos/practicas/tp7/efiler/ejercicio1
    ln -s "$practicas_dir/TP2/ejercicio2" ~/documentos/practicas/tp7/efiler/ejercicio2
fi
echo "Enlaces simbolicos creados en edirectory y efiler"
