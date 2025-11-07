#!/bin/bash

# Script que copia archivos modificados en el año 2024 a una carpeta "bk"
# y muestra la cantidad de archivos copiados.

if [ ! -d "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

ORIG="$1"
DEST="./bk"

# Crear carpeta bk si no existe
mkdir -p "$DEST"

# Copiar archivos modificados en 2024
find "$ORIG" -type f -newermt 2024-01-01 ! -newermt 2025-01-01 -exec cp {} "$DEST/" \;

# Contar archivos copiados
cantidad=$(find "$ORIG" -type f -newermt 2024-01-01 ! -newermt 2025-01-01 | wc -l)
echo "Cantidad de archivos copiados: $cantidad"
