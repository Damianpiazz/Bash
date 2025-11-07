#!/bin/bash

# Descripción: Verifica que un grupo pasado como parámetro exista en el sistema.
# Comentarios: Útil para scripts que necesitan ejecutar acciones sobre un grupo específico.

if getent group "$1" >/dev/null; then
    echo "Grupo existe"
else
    echo "Grupo no existe"
    exit 1
fi
