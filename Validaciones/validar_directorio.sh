#!/bin/bash

# Validación de directorio
# Uso: ./validar_directorio.sh <directorio>

if [ ! -d "$1" ]; then
    echo "El parámetro '$1' no es un directorio válido."
    exit 1
fi