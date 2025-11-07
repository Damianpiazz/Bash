#!/bin/bash

# Descripción: Muestra solo las líneas únicas de un archivo (elimina duplicadas consecutivas).

read -p "Ingrese el archivo: " archivo

if [ ! -f "$archivo" ]; then
    echo "Archivo no válido."
    exit 1
fi

echo "Líneas únicas en el archivo:"
uniq "$archivo"
