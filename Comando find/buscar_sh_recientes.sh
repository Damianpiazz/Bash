#!/bin/bash

# Script que recorre un directorio, copia los archivos .sh modificados hace menos de un mes
# con permisos 755 a una carpeta "encontrados" y crea un enlace simbólico en el directorio actual.

if [ ! -d "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

ORIG="$1"
DEST="./directorio/encontrados"
ENLACE="./directorio/enlace_encontrados"

# Crear carpeta encontrados
mkdir -p "$DEST"

# Copiar archivos .sh recientes con permisos 755
for file in $(find "$ORIG" -type f -name "*.sh" -mtime -30 -perm 755); do
    cp "$file" "$DEST/"
done

# Crear enlace simbólico
ln -sf "$DEST" "$ENLACE"

echo "Archivos copiados a $DEST"
echo "Enlace simbólico creado en $ENLACE"