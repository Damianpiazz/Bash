#!/bin/bash
# Limitar el número de procesos de un usuario
# Si el usuario supera N procesos, termina los más antiguos.

read -p "Ingrese el nombre del usuario: " usuario
read -p "Ingrese el número máximo permitido de procesos: " limite

# Contar procesos activos
total=$(ps -u "$usuario" --no-headers | wc -l)

if [ "$total" -gt "$limite" ]; then
    exceso=$((total - limite))
    echo "El usuario $usuario tiene $total procesos. Terminando $exceso..."
    
    # Terminar los procesos más antiguos
    ps -u "$usuario" --sort=start_time | head -n "$exceso" | awk '{print $1}' | xargs kill
else
    echo "El usuario $usuario está dentro del límite de procesos permitidos."
fi
