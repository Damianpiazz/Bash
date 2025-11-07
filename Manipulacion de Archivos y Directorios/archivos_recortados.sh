#!/bin/bash

# Descripción: Procesa un directorio pasado como parámetro. 
# - Cuenta los archivos con más de 10 líneas.
# - Suma la cantidad total de líneas para calcular el promedio.
# - Crea una copia recortada (primeras 10 líneas) de cada archivo que cumpla la condición.
# - Muestra el nombre de cada archivo procesado, cantidad de archivos procesados y promedio de líneas.

# Verificar que se haya pasado un directorio como parámetro
if [ ! -d "$1" ]; then
    echo "Parametro 1 no es directorio"
    exit
fi

# Inicializar contador de archivos y acumulador de líneas
rec=0
prom=0

# Iterar sobre los archivos del directorio
for it in "$1"/*; do
    # Verificar si es archivo y tiene más de 10 líneas
    if [ -f "$it" ] && [ "$(wc -l < "$it")" -gt 10 ]; then
        rec=$((rec + 1))
        L="$(wc -l < "$it")"
        prom=$((prom + L))
        
        # Mostrar nombre del archivo
        echo "Nombre del archivo $(basename "$it")"
        
        # Crear archivo recortado con las primeras 10 líneas
        nom="$(basename "$it")_recortado"
        head "$it" > "$nom"
    fi
done

# Calcular promedio de líneas por archivo
prom=$((prom / rec))

# Mostrar resultados finales
echo "Cantidad de archivos procesados: $rec"
echo "Promedio de líneas por archivo: $prom"