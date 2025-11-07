#!/bin/bash

# Descripción: Comprueba si un dispositivo específico está montado.
# Comentarios: Evita errores al ejecutar operaciones de disco sobre dispositivos no montados.

if ! mount | grep -q "^/dev/sda1"; then
    echo "Dispositivo no montado"
    exit 1
fi

echo "Dispositivo montado"
