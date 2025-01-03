#!/bin/bash

if ! command -v netstat &> /dev/null; then
    echo "El comando netstat no está disponible. Asegúrate de tener el paquete net-tools instalado."
    exit 1
fi

netstat -tuln | grep ':80'

netstat -tuln | grep ':433'