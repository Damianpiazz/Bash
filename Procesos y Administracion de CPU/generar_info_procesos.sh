#!/bin/bash

# Genera un archivo con información de los procesos activos de un usuario.
# - Si se pasa un usuario como parámetro: crea ./directorio/PROC.txt
# - Si no se pasa parámetro: crea ./directorio/Mis-Proc.txt con los procesos del usuario actual

# Verificar si se pasó un parámetro (nombre de usuario)
if [ -n "$1" ]; then
    # Si se pasa un usuario, obtener sus procesos y guardarlos en PROC.txt
    ps -u "$1" -eo pid,comm > "./directorio/PROC.txt"
else
    # Si no se pasa usuario, obtener los procesos del usuario actual y guardarlos en Mis-Proc.txt
    ps -u "$USER" -eo pid,comm > "./directorio/Mis-Proc.txt"
fi
