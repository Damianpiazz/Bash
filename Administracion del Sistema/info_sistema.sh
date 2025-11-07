#!/bin/bash

# Descripción:
# Este script muestra información básica del sistema en ejecución:
# - Cantidad de usuarios conectados
# - Tiempo de encendido del sistema
# - Promedio de carga del CPU en los últimos 1, 5 y 15 minutos

# Muestra la cantidad de usuarios actualmente conectados al sistema
echo "Usuarios conectados: $(who | wc -l)"

# Muestra el tiempo que el sistema lleva encendido en formato legible (por ejemplo, "up 2 hours, 30 minutes")
echo "Tiempo encendido: $(uptime -p)"

# Muestra el promedio de carga del CPU en los últimos 1, 5 y 15 minutos
# (extraído con awk desde el comando uptime)
echo "Promedio de carga en los últimos 1, 5 y 15 minutos: $(uptime | awk -F'load average:' '{print $2}')"
