#!/bin/bash

# Verifica que el primer parámetro sea un directorio válido
if [ ! -d $1 ]
then
    echo "<Paramtero 1> debe ser directorio"
    exit
fi

# Recorre todos los elementos dentro del directorio pasado por parámetro
for item in $1/*
do
    # Si el elemento es un archivo regular, se procesa
    if [ -f "$item" ]
    then
        # Agrega tres espacios al inicio de cada línea del archivo
        sed "s/^/   /" $item    

        # Agrega tres espacios al final de cada línea del archivo
        sed "s/$/   /" $item    
    fi
done
