#!/bin/bash

# Registrar procesos en un log
# Guarda cada minuto los procesos activos en el archivo procesos.log

logfile="./procesos.log"

echo "Iniciando registro de procesos (Ctrl + C para detener)..."
while true; do
    echo "=== Registro $(date) ===" >> "$logfile"
    ps -eo pid,user,comm,%cpu,%mem --sort=-%cpu >> "$logfile"
    echo "" >> "$logfile"
    sleep 60  # Esperar 1 minuto
done
