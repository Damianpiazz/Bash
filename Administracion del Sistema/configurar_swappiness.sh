#!/bin/bash

# Descripción:
# Este script permite modificar el porcentaje de uso de la memoria virtual (swap)
# del sistema Linux, ajustando el parámetro "vm.swappiness" mediante el comando sysctl.
# El usuario selecciona entre 0%, 50% o 100%, y el script aplica el valor elegido.

# Muestra las opciones disponibles para configurar el porcentaje de memoria virtual
echo "1) 0%   - Porcentaje de memoria virtual (swap mínima)"
echo "2) 50%  - Porcentaje de memoria virtual (balanceado)"
echo "3) 100% - Porcentaje de memoria virtual (uso máximo)"

# Lee la opción ingresada por el usuario
read -r porcentaje

# Verifica la opción elegida y aplica el valor correspondiente con sysctl
if [ "$porcentaje" -eq 1 ]; then
    sudo sysctl vm.swappiness=0        # Desactiva el uso de swap (solo RAM)
    echo "Swap configurada al 0%"
elif [ "$porcentaje" -eq 2 ]; then
    sudo sysctl vm.swappiness=50       # Uso equilibrado entre RAM y swap
    echo "Swap configurada al 50%"
elif [ "$porcentaje" -eq 3 ]; then
    sudo sysctl vm.swappiness=100      # Uso máximo de swap antes que RAM
    echo "Swap configurada al 100%"
else
    # Si la entrada no es válida, muestra un mensaje de error
    echo "Entrada no válida. Debe seleccionar 1, 2 o 3."
fi
