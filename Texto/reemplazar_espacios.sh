#!/bin/bash

# Descripción: Reemplaza todos los espacios en un archivo por guiones bajos (_) usando tr.

read -p "Ingrese el nombre del archivo: " archivo

if [ ! -f "$archivo" ]; then
    echo "Archivo no encontrado."
    exit 1
fi

echo "Texto con espacios reemplazados por guiones bajos:"
cat "$archivo" | tr ' ' '_'
