#!/bin/bash

# Descripción: Compara el tamaño de dos archivos pasados como parámetros.
# Muestra el nombre del archivo más grande y su tamaño. 
# Si tienen el mismo tamaño, muestra el mensaje "son iguales".

echo "Inicio programa"

# Verificar que ambos parámetros sean archivos regulares
if [ ! -f "$1" ] || [ ! -f "$2" ]; then
    echo "<Parametro 1> y <Parametro 2> deben ser archivos regulares"
    exit
fi

# Obtener tamaño de los archivos en bytes
tam1=$(stat -c %s "$1")
tam2=$(stat -c %s "$2")

# Comparar tamaños
if [ "$tam1" -gt "$tam2" ]; then
    echo "$1 es mayor: $tam1 bytes"
elif [ "$tam1" -eq "$tam2" ]; then
    echo "son iguales"
else
    echo "$2 es mayor: $tam2 bytes"
fi

echo "Finalizando programa"