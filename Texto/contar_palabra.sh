#!/bin/bash

# Descripción: Cuenta el número de veces que una palabra aparece en un archivo de texto.

read -p "Ingrese el archivo: " archivo
read -p "Ingrese la palabra a buscar: " palabra

if [ ! -f "$archivo" ]; then
    echo "Archivo no encontrado."
    exit 1
fi

cantidad=$(grep -o "$palabra" "$archivo" | wc -l)
echo "La palabra '$palabra' aparece $cantidad veces en '$archivo'."
