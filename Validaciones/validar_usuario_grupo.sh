#!/bin/bash

# Descripción: Verifica si un usuario pertenece a un grupo determinado.
# Comentarios: Evita ejecutar acciones sobre usuarios que no forman parte de un grupo específico.

usuario="$1"
grupo="$2"

if id -nG "$usuario" | grep -qw "$grupo"; then
    echo "Usuario pertenece al grupo"
else
    echo "Usuario no pertenece al grupo"
    exit 1
fi
