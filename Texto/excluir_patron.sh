#!/bin/bash

# Descripción: Muestra todas las líneas que NO contienen una palabra o patrón dado.

read -p "Ingrese el archivo: " archivo
read -p "Ingrese el patrón a excluir: " patron

if [ ! -f "$archivo" ]; then
    echo "Archivo no encontrado."
    exit 1
fi

grep -v "$patron" "$archivo"
