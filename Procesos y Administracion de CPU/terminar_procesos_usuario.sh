#!/bin/bash

# Descripción: Finaliza todos los procesos pertenecientes a un usuario
# pasado como parámetro al ejecutar el script.

# Verificar si se pasó un parámetro (nombre de usuario)
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_de_usuario>"
    exit 1
fi

# Termina todos los procesos del usuario pasado como parámetro
pkill -u "$1"  # Mata todos los procesos del usuario indicado

# Mensaje de confirmación
echo "Todos los procesos de '$1' han sido terminados."
