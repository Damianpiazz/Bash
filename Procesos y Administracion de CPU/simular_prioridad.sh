#!/bin/bash

# Simular prioridad de procesos
# Baja la prioridad (aumenta nice) de los procesos que superen 50% de CPU.

ps -eo pid,%cpu,comm --no-headers | awk '$2>50 {print $1,$3}' | while read pid comm; do
    sudo renice +10 -p "$pid" >/dev/null
    echo "Proceso '$comm' (PID $pid) ajustado con menor prioridad por alto consumo de CPU."
done
