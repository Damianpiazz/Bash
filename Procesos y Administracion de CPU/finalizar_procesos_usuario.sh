#!/bin/bash

# Descripción: Finaliza todos los procesos de un usuario específico que se estén
# ejecutando desde hace más de una hora. Si no se pasa un usuario, actúa sobre el usuario actual.

# Verificar si se ha pasado un nombre de usuario como parámetro
if [ -n "$1" ]; then
    usuario="$1"              # Si hay parámetro, se usa como nombre de usuario
else
    usuario="$USER"           # Si no, se toma el usuario actual
fi

# Buscar todos los procesos del usuario con su PID, tiempo de ejecución y comando
# --sort=etime los ordena según el tiempo que llevan ejecutándose
ps -u "$usuario" -eo pid,etime,comm --sort=etime | while read pid etime comm; do

    # Si el tiempo de ejecución tiene formato D-HH:MM (más de un día)
    if [[ "$etime" =~ ([0-9]+)-([0-9]+):([0-9]+) ]]; then
        kill "$pid"  # Termina el proceso
        echo "Proceso '$comm' con PID $pid terminado (ejecutando por más de 1 día)."

    # Si el tiempo de ejecución tiene formato HH:MM (más de una hora)
    elif [[ "$etime" =~ ([0-9]+):([0-9]+) ]]; then
        kill "$pid"  # Termina el proceso
        echo "Proceso '$comm' con PID $pid terminado (ejecutando por más de 1 hora)."
    fi

done
