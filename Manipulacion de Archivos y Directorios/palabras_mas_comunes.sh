#!/bin/bash

# Cuenta las 10 palabras más frecuentes en un archivo

# Verificar si se proporcionó un archivo como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo="$1"

# Verificar si el archivo existe
if [ ! -f "$archivo" ]; then
    echo "Error: El archivo '$archivo' no existe."
    exit 1
fi

# Contar las palabras más comunes en el archivo
echo "10 palabras más frecuentes en '$archivo':"
tr -s '[:space:]' '\n' < "$archivo" | grep -v '^$' | sort | uniq -c | sort -rn | head -10