#!/bin/bash

# Este script presenta un menú con tres opciones principales:
# a) Compilar un programa en C.
# b) Ejecutar un script y guardar su salida en un archivo llamado "archivo_resultante.txt".
# c) Generar una línea de configuración para una tarea programada (cron),
#    que ejecute el programa automáticamente los lunes y jueves de agosto a las 23:59 hs.
# El resultado de esta configuración se guarda en un archivo llamado "resultado.cron".

# Mostrar menú de opciones
echo "a) Compilar"
echo "b) Ejecutar programa"
echo "c) Tarea programada"

# Leer opción del usuario
read -p "Ingrese una opción (a, b o c): " input

# Estructura de control según la opción elegida
case $input in
    a)
        # Opción a: compilar el programa en C
        echo "Compilando..."
        gcc parcial5_1.c -o parcial5_1
        ;;
    b)
        # Opción b: ejecutar un script y guardar la salida en un archivo
        echo "Ejecutando..."
        echo "$(./ejemplo45.sh)" > ./directorio/archivo_resultante.txt
        ;;
    c)
        # Opción c: crear una línea de cron que ejecute el programa
        # los lunes y jueves del mes de agosto a las 23:59 hs.
        echo "Creando tarea programada..."
        echo "59 23 * 8 1,4 $(pwd)/parcial5_1 > $(pwd)/directorio/archivo_resultante.txt" > ./directorio/resultado.cron  # Importante
        ;;
    *)
        # Opción inválida
        echo "Error: opción no válida."
        exit 1
        ;;
esac
