#!/bin/bash

# Descripción: Verifica que un puerto específico esté abierto en un host.
# Comentarios: Útil para comprobar servicios antes de ejecutar acciones de red.

host="$1"
puerto="$2"

if ! nc -z "$host" "$puerto"; then
    echo "Puerto cerrado"
    exit 1
fi

echo "Puerto abierto"
