#!/bin/bash

# Descripción: Menú con 3 opciones para un programa:
# a) Compilar: compila el programa parcial6_1.c
# b) Ejecutar programa: ejecuta el programa y guarda el resultado en archivo_resultante.txt
# c) Empaquetar y comprimir: comprime archivo_resultante.txt con fecha y hora en el nombre

echo "Opciones:"
echo "a. Compilar"
echo "b. Ejecutar"
echo "c. Empaquetar y comprimir"

read -p "Ingrese una opción: " input

case $input in
    a)
        echo "Compilando..."
        gcc parcial6_1.c -o parcial6_1
        ;;
    b)
        echo "Ejecutando..."
        # Ejecuta el programa y guarda la salida en archivo_resultante.txt dentro de ./directorio
        echo "$(./ejemplo46.sh)" > ./directorio/archivo_resultante.txt
        ;;
    c)
        echo "Empaquetando y comprimiendo..."
        # Crea un archivo comprimido con la fecha y hora actuales en el nombre
        tar -czf "comprimido_$(date +%Y-%m-%d-%H-%M-%S).tar.gz" ./directorio/archivo_resultante.txt
        ;;
    *)
        echo "Opción no válida. Saliendo..."
        exit
        ;;
esac