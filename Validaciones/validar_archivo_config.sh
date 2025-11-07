#!/bin/bash

# Descripción: Verifica que un archivo de configuración exista en /etc.
# Comentarios: Útil para scripts que dependen de archivos de configuración del sistema.

if [ ! -f "/etc/$1" ]; then
    echo "Archivo de configuración no encontrado"
    exit 1
fi

echo "Archivo de configuración encontrado"
