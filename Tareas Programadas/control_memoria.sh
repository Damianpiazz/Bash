#!/bin/bash

# Este script monitorea el uso de memoria RAM del sistema.
# Calcula el porcentaje de memoria libre y, si es menor al 70%,
# genera un archivo llamado "informe.txt" con la advertencia "Memoria baja"
# y los valores de memoria total y libre.
#
# También se sugiere una tarea programada (cron) para ejecutarlo automáticamente
# cada 5 minutos entre la medianoche y las 8 de la mañana.

# Obtener la cantidad total de memoria (en KB)
total=$(free | tail -2 | head -1 | awk '{print $2}')

# Obtener la cantidad de memoria libre (en KB)
libre=$(free | tail -2 | head -1 | awk '{print $4}')

# Calcular el porcentaje de memoria libre
let p=$libre*100/$total

echo "Porcentaje de memoria libre: $p%"

# Si el porcentaje es menor a 70, generar informe
if [ $p -lt 70 ]; then
    echo "Memoria baja" > "informe.txt"

    # Agregar información detallada al archivo informe.txt
    echo "Memoria total: $(free -h | tail -2 | head -1 | awk '{print $2}')" >> "informe.txt"
    echo "Memoria libre: $(free -h | tail -2 | head -1 | awk '{print $4}')" >> "informe.txt"
fi

# EJEMPLO DE TAREA PROGRAMADA (crontab)
# Para editar las tareas programadas, ejecutar: crontab -e
#
# Formato: minuto hora día(mes) mes día(semana) comando
#
# Ejecutar este script cada 5 minutos entre las 00:00 y las 08:00:
# */5 0-8 * * * /home/damip/memoria.sh
