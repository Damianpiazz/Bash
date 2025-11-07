#!/bin/bash

# Validación de archivo
# Uso: ./validar_archivo.sh <archivo>

if [ ! -f "$1" ]; then
    echo "El parámetro '$1' no es un archivo válido."
    exit 1
fi