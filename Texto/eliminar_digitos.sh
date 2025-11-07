#!/bin/bash

# Descripción: Elimina todos los números de un archivo de texto usando tr.

read -p "Ingrese el nombre del archivo: " archivo

if [ ! -f "$archivo" ]; then
    echo "Archivo inválido."
    exit 1
fi

echo "Texto sin números:"
cat "$archivo" | tr -d '0-9'
