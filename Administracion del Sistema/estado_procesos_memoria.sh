#!/bin/bash

# Descripción:
# Este script muestra información sobre el estado actual de los procesos y la memoria en el sistema.
# Utiliza el comando `vmstat` para obtener datos sobre:
# a) Procesos esperando por CPU
# b) Procesos bloqueados (en estado dormido)
# c) Uso de memoria swap
# d) Cantidad de memoria intercambiada desde el disco
# e) Cantidad de memoria intercambiada hacia el disco

# Ejecutar vmstat y almacenar su salida
info=$(vmstat 1 2 | tail -1)

# Mostrar los datos procesados
echo "Procesos esperando por la CPU: $(echo "$info" | awk '{print $1}')"
echo "Procesos bloqueados (en estado dormido): $(echo "$info" | awk '{print $2}')"
echo "Uso de memoria swap (en KB):"
echo "  - Desde disco (swap in): $(echo "$info" | awk '{print $7}')"
echo "  - Hacia disco (swap out): $(echo "$info" | awk '{print $8}')"

# Comprobar si se está usando memoria swap
swap_total=$(free | grep Swap | awk '{print $2}')
swap_usado=$(free | grep Swap | awk '{print $3}')

if [ "$swap_usado" -gt 0 ]; then
    echo "Actualmente se está utilizando memoria swap."
else
    echo "No se está utilizando memoria swap."
fi
