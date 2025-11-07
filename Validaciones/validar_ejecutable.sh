#!/bin/bash

# Validación de archivo ejecutable
# Uso: ./validar_ejecutable.sh <archivo>

if [ ! -x "$1" ]; then
    echo "El archivo '$1' no tiene permisos de ejecución."
    exit 1
fi