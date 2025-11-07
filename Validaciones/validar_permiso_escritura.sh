#!/bin/bash

# Validación de permisos de escritura
# Uso: ./validar_permiso_escritura.sh <archivo>

if [ ! -w "$1" ]; then
    echo "No tiene permisos de escritura sobre '$1'."
    exit 1
fi