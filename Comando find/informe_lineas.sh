#!/bin/bash

#Descripción: Este script recibe como parámetro un directorio y genera un informe llamado "informe.txt" dentro de ese mismo directorio. 
# El informe contiene la cantidad de líneas de cada archivo ordinario presente en el directorio (solo a nivel de ese directorio, sin recorrer subdirectorios) y un contador total de archivos procesados. 

# Cantidad de lineas del archivo xxxx = 20
# Cantidad de lineas del archivo yyyy = 5
# Cantidad total de archivos ordinarios procesados = 100

if [ ! -d "$1" ]; then
    echo "Debe ser un directorio"
    exit
fi

c=0

echo "Lineas	Nombre" > "$1/informe.txt"
echo "" >> "$1/informe.txt"

# Usando for con find
for item in $(find "$1" -maxdepth 1 -type f); do
    # mostrar nombre y cantidad de lineas
    wc -l "$item" >> "$1/informe.txt"
    echo "" >> "$1/informe.txt"
    # incrementar contador
    c=$((c + 1))
done

echo "cantidad de procesados: $c" >> "$1/informe.txt"