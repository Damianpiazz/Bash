#!/bin/bash

# Script que recorre un directorio y procesa archivos con más de 10 líneas.
# Para cada archivo cumple más de 10 líneas:
#   - Cuenta la cantidad de archivos procesados
#   - Suma las líneas para calcular un promedio
#   - Crea un archivo recortado con las primeras 10 líneas del archivo original
# Al final muestra la cantidad de archivos procesados y el promedio de líneas.

# Verificar que el parámetro sea un directorio válido
if [ ! -d "$1" ]; then
    echo "Parametro 1 no es directorio"
    exit
fi

rec=0    # Contador de archivos procesados
prom=0   # Acumulador de líneas

# Iterar sobre los archivos del directorio
for it in "$1"/*; do
    if [ -f "$it" ] && [ "$(wc -l < "$it")" -gt 10 ]; then
        rec=$((rec + 1))                  # Incrementar contador
        L="$(wc -l < "$it")"              # Obtener cantidad de líneas
        prom=$((prom + L))                # Sumar para promedio
        echo "Nombre del archivo $(basename "$it")"
        
        # Crear archivo recortado con primeras 10 líneas
        nom="$(basename "$it")_recortado"
        head -n 10 "$it" > "$nom"
    fi
done

# Calcular promedio de líneas
if [ "$rec" -gt 0 ]; then
    prom=$((prom / rec))
fi

# Mostrar resultados
echo "rec: $rec"
echo "prom: $prom"