#!/bin/bash

# Validación de presencia de parámetro
# Uso: ./validar_parametro.sh <parametro>

if [ -z "$1" ]; then
    echo "No se proporcionó ningún parámetro."
    echo "Uso: $0 <parametro>"
    exit 1
fi