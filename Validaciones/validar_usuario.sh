#!/bin/bash

# Validación de existencia de usuario
# Uso: ./validar_usuario.sh <nombre_usuario>

if id "$1" >/dev/null 2>&1; then
    echo "El usuario '$1' existe en el sistema."
else
    echo "El usuario '$1' no existe."
    exit 1
fi
