#!/bin/bash

# Validación de ruta absoluta
# Uso: ./validar_ruta_absoluta.sh <ruta>

if [[ "$1" != /* ]]; then
    echo "La ruta '$1' no es absoluta."
    exit 1
fi