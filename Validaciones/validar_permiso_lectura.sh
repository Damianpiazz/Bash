#!/bin/bash

# Validación de permisos de lectura
# Uso: ./validar_permiso_lectura.sh <archivo>

if [ ! -r "$1" ]; then
    echo "No tiene permisos de lectura sobre '$1'."
    exit 1
fi