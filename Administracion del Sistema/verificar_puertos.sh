#!/bin/bash

# Descripción:
# Este script verifica si existen conexiones activas en los puertos 80 (HTTP)
# y 443 (HTTPS) utilizando el comando `netstat`. Si el comando no está disponible,
# muestra un mensaje indicando que se debe instalar el paquete `net-tools`.

# Verificar si el comando netstat está disponible en el sistema
if ! command -v netstat &> /dev/null; then
    echo "El comando netstat no está disponible. Asegúrate de tener el paquete net-tools instalado."
    exit 1
fi

# Mostrar las conexiones activas en el puerto 80 (HTTP)
netstat -tuln | grep ':80'

# Mostrar las conexiones activas en el puerto 443 (HTTPS)
netstat -tuln | grep ':443'
