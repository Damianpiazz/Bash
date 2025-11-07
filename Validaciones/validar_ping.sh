#!/bin/bash

# Descripción: Comprueba que un host sea accesible mediante ping.
# Comentarios: Evita errores en scripts que dependen de conectividad de red.

if ! ping -c 1 "$1" &>/dev/null; then
    echo "Host no accesible"
    exit 1
fi

echo "Host accesible"
