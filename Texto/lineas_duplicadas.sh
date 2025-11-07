#!/bin/bash

# Descripción: Muestra únicamente las líneas que aparecen más de una vez en un archivo.

read -p "Ingrese el archivo: " archivo

if [ ! -f "$archivo" ]; then
    echo "Archivo no válido."
    exit 1
fi

echo "Líneas duplicadas:"
sort "$archivo" | uniq -d
