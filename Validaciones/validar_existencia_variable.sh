#!/bin/bash

# Validación de existencia de variable de entorno
# Uso: ./validar_existencia_variable.sh <nombre_variable>

if [ -z "${!1}" ]; then
    echo "La variable de entorno '$1' no está definida."
    exit 1
fi