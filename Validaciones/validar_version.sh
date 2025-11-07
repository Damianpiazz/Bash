#!/bin/bash

# Descripción: Verifica que la versión de bash cumpla con un mínimo requerido.
# Comentarios: Evita errores en scripts que necesitan características de versiones recientes.

version=$(awk -F. '{print $1}' <<< $(bash --version | head -1 | awk '{print $4}'))
if [ "$version" -lt 5 ]; then
    echo "Versión de bash demasiado baja"
    exit 1
fi

echo "Versión de bash válida"
