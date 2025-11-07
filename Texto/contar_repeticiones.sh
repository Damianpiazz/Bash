#!/bin/bash

# Descripción: Muestra las líneas del archivo junto con la cantidad de veces que se repiten.

read -p "Ingrese el archivo: " archivo

if [ ! -f "$archivo" ]; then
    echo "Archivo no encontrado."
    exit 1
fi

echo "Conteo de repeticiones:"
sort "$archivo" | uniq -c
