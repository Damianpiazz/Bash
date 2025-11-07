#!/bin/bash

# Descripción:
#   Cuenta la cantidad de ficheros dentro del home de un usuario dado
#   que tengan un tamaño mayor al indicado (en bytes).
# Uso:
#   ./contar_ficheros_grandes.sh usuario tamaño_en_bytes

# Verificar que el usuario existe
if id "$1" >/dev/null 2>&1; then
    echo "Usuario '$1' encontrado."
else
    echo "usuario no encontrado"
    exit 1
fi

# Buscar archivos mayores al tamaño indicado
archivos=$(find "/home/$1" -type f -size +"$2"c)

# Contar la cantidad de archivos encontrados
cantidad=$(echo "$archivos" | wc -l)

# Mostrar resultado
echo "Cantidad de archivos mayores a $2 bytes en /home/$1: $cantidad"