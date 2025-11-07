#!/bin/bash

# Descripción: Muestra las líneas que comienzan con un texto específico.

read -p "Ingrese el archivo: " archivo
read -p "Ingrese el texto con el que deben comenzar las líneas: " inicio

if [ ! -f "$archivo" ]; then
    echo "Archivo no válido."
    exit 1
fi

grep "^$inicio" "$archivo"
