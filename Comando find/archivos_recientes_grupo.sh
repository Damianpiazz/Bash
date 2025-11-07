#!/bin/bash

# Descripción:
#   Este script recibe como parámetro un directorio y genera un archivo llamado "perm.txt"
#   que contiene la lista de todos los archivos dentro de ese directorio que cumplen:
#     1. Fueron modificados en los últimos 2 días.
#     2. Tienen permisos de ejecución para el grupo (g=x).
#   Si el parámetro no es un directorio, se muestra un mensaje de error y se termina el script.

# Verificar que el parámetro sea un directorio
if [ ! -d "$1" ]; then
    echo "Debe ser directorio"
    exit 1
fi

# Crear archivo de salida
touch perm.txt

# Buscar archivos modificados en los últimos 2 días y con permisos de ejecución para grupo
find "$1" -type f -mtime -2 -perm /g=x >> "perm.txt"