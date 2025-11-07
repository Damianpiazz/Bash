#!/bin/bash

# Descripción: Busca y finaliza todos los procesos que usan más del 50% de CPU
# pertenecientes al usuario actual.

# Obtener los procesos que consumen más del 50% de la CPU
# ps -eo pid,%cpu,comm --sort=-%cpu -> muestra PID, %CPU y nombre del comando, ordenados por uso de CPU
# awk '$2 > 50' -> filtra solo las líneas donde el segundo campo (%CPU) sea mayor que 50
ps -eo pid,%cpu,comm --sort=-%cpu | awk '$2 > 50' | while read pid cpu comm; do

    # Verificar si el proceso pertenece al usuario actual
    # ps -p $pid -o user= -> obtiene el nombre del usuario que ejecuta el proceso
    if [ "$(ps -p $pid -o user=)" == "$USER" ]; then

        # Terminar el proceso con kill
        kill "$pid"

        # Mostrar mensaje informativo en consola
        echo "Proceso '$comm' con PID $pid terminado por usar más del 50% de CPU."
    fi
done
