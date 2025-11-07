#!/bin/bash

# Descripción: Verifica si un proceso con un nombre específico
# está en ejecución. Si está activo, lo termina; si no, lo inicia.
# Uso: ./control_proceso.sh <nombre_proceso>

# Verifica si se pasó el nombre del proceso como parámetro
if [ -n "$1" ]; then
    proceso="$1"  # Asigna el nombre del proceso a una variable
else
    echo "Debe especificar el nombre de un proceso."
    exit 1        # Sale del script si no se pasó parámetro
fi

# Busca el PID (identificador del proceso) por nombre exacto
pid=$(pgrep -x "$proceso")

if [ -n "$pid" ]; then
    # Si el proceso está en ejecución, lo termina
    kill "$pid"
    echo "Proceso '$proceso' (PID $pid) terminado."
else
    # Si el proceso no está en ejecución, lo inicia
    echo "Proceso '$proceso' no encontrado. Iniciando..."
    "$proceso" &  # Ejecuta el proceso en segundo plano
    echo "Proceso '$proceso' iniciado."
fi
