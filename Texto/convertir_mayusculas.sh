#!/bin/bash

# Descripción: Convierte todo el contenido de un archivo a mayúsculas usando tr.

read -p "Ingrese el nombre del archivo: " archivo

if [ ! -f "$archivo" ]; then
    echo "El archivo no existe."
    exit 1
fi

echo "Contenido en mayúsculas:"
cat "$archivo" | tr '[:lower:]' '[:upper:]'
