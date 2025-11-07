#!/bin/bash

# Validación de cantidad de parámetros
# Uso: ./validar_cantidad_parametros.sh <archivo> <directorio>

if [ "$#" -ne 2 ]; then
    echo "Uso incorrecto. Se requieren exactamente 2 parámetros."
    exit 1
fi