#!/bin/bash

# Descripción:
# Este script obtiene información básica de red del sistema, incluyendo la
# dirección física (MAC), la dirección IP y la máscara de subred. 
# Utiliza el comando `ifconfig`, por lo que requiere tener instalado el paquete `net-tools`.

# Verifica si el comando ifconfig está disponible en el sistema
if ! command -v ifconfig &> /dev/null; then
    echo "El comando ifconfig no está disponible. Asegúrate de tener el paquete net-tools instalado."
    exit
fi

# Extrae y muestra la dirección física (MAC)
echo "$(ifconfig | grep -i 'ether' | awk '{print $2}')"

# Extrae y muestra la dirección IP (inet)
echo "$(ifconfig | grep 'inet ' | awk '{print $2}')"

# Extrae y muestra la máscara de subred
echo "$(ifconfig | grep 'inet ' | awk '{print $4}')"
