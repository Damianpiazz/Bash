#!/bin/bash

# Validación de número entero
# Uso: ./validar_numero_entero.sh <numero>

if ! [[ "$1" =~ ^-?[0-9]+$ ]]; then
    echo "Por favor, introduce un número entero válido."
    exit 1
fi