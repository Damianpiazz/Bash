#!/bin/bash

# Detectar y matar procesos zombies
# Muestra procesos con estado "Z" (zombie)

echo "Buscando procesos zombies..."
zombies=$(ps -eo pid,ppid,stat,comm | grep " Z" | grep -v "grep")

if [ -z "$zombies" ]; then
    echo "No se encontraron procesos zombies."
else
    echo "Procesos zombies detectados:"
    echo "$zombies"
fi
