#!/bin/bash

# Script para analizar directorios y archivos
# - Opción 1: Obtener archivo más pesado y contar archivos .txt en un directorio
# - Opción 2: Modificar un archivo ejecutable, mostrar su contenido sin las últimas 5 líneas

echo "1) Directorio"
echo "2) Archivo"

# Leer opción del usuario
read -p "Ingrese una opción: " k

tam=0
con=0

case $k in
1)
    # Opción Directorio
    read -p "<Directorio>: " dir
    if [ -d "$dir" ]; then
        # Iterar sobre archivos del directorio para determinar el más pesado
        for item in "$dir"/*; do
            if [ -f "$item" ]; then
                aux=$(stat -c %s "$item")
                echo "$aux"
                if [ $aux -gt $tam ]; then
                    tam=$aux
                fi
            fi
        done
        # Contar archivos .txt
        for item in "$dir"/*.txt; do
            con=$((con + 1))
        done
    fi
    echo "Cantidad de archivos .txt: $con"
    echo "Archivo más pesado: $tam bytes"
;;
2)
    # Opción Archivo
    ls
    read -p "<Archivo>: " arc
    if [ -x "$arc" ]; then
        echo "Es ejecutable"
        num=$(wc -l < "$arc")
        echo "Cantidad de líneas: $num"
        num=$((num - 5))
        # Crear archivo temporal con contenido modificado
        head -n "$num" "$arc" > "$arc.tmp"
        echo "Contenido modificado:"
        cat "$arc.tmp"
        mv "$arc.tmp" "$arc"
    fi
;;
*)
    echo "Opción incorrecta"
;;
esac