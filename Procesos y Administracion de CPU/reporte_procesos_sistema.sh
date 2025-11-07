#!/bin/bash

# Controlar y reportar procesos del sistema
# Muestra cantidad total de procesos, cuántos son de root,
# estados y consumo total de CPU/memoria.

total=$(ps -e --no-headers | wc -l)
root=$(ps -u root --no-headers | wc -l)
sleeping=$(ps -eo stat | grep -c "S")
running=$(ps -eo stat | grep -c "R")
cpu_total=$(ps -eo %cpu --no-headers | awk '{sum+=$1} END {print sum}')
mem_total=$(ps -eo %mem --no-headers | awk '{sum+=$1} END {print sum}')

echo "=== REPORTE DE PROCESOS DEL SISTEMA ==="
echo "Total de procesos:        $total"
echo "Procesos de root:         $root"
echo "Procesos en estado Sleep: $sleeping"
echo "Procesos en estado Run:   $running"
echo "Consumo total de CPU:     $cpu_total%"
echo "Consumo total de Memoria: $mem_total%"
