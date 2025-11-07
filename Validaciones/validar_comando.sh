#!/bin/bash

# Validación de disponibilidad de comando
# Uso: ./validar_comando.sh <comando>

if ! command -v netstat &> /dev/null; then
    echo "El comando 'netstat' no está disponible. Instale net-tools."
    exit 1
fi