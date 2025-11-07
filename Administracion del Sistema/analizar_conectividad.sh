#!/bin/bash

# Descripción:
# Este script realiza un ping a una dirección IP pasada como parámetro,
# verifica si hay conectividad, y genera un informe con los tiempos de respuesta
# mínimos, máximos y promedio.  
# Utiliza comandos como ping, awk, sort, bc y grep para procesar los datos.

# Inicializar variables para cálculos
sumatoria=0
contador=0

# Verificar si se pasó una dirección IP como parámetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <direccion_IP>"
    exit 1
fi

# Realizar el ping (4 paquetes) y capturar los resultados
resultado=$(ping -c 4 "$1")

# Comprobar si hubo error en la conexión (host inalcanzable)
if echo "$resultado" | grep -q "unreachable"; then
    echo "No hay conectividad con $1"
    exit 1
fi

# Extraer los tiempos de respuesta (ms) de cada paquete enviado
tiempos=$(echo "$resultado" | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')

# Calcular el tiempo mínimo (ordenando de menor a mayor y tomando el primero)
minimo=$(echo "$tiempos" | sort -n | head -n 1)

# Sumar los tiempos y contar la cantidad de respuestas válidas
for tiempo in $tiempos; do
    sumatoria=$(echo "$sumatoria + $tiempo" | bc)  # Suma acumulada
    ((contador++))                                 # Contador de tiempos
done

# Calcular el promedio (solo si hubo respuestas válidas)
if [ $contador -ne 0 ]; then
    promedio=$(echo "$sumatoria / $contador" | bc -l)
else
    promedio=0
fi

# Calcular el tiempo máximo (último en la lista ordenada)
maximo=$(echo "$tiempos" | sort -n | tail -n 1)

# Mostrar el informe final con los resultados
echo "Informe de conectividad para $1:"
echo "Conectividad: Existe"
echo "Tiempo de round-trip:"
echo "Mínimo: $minimo ms"
echo "Promedio: $promedio ms"
echo "Máximo: $maximo ms"
