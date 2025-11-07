#!/bin/bash

# Descripción:
# Este script obtiene información del uso de la memoria RAM del sistema y
# la guarda en un archivo llamado "info-ram.txt" dentro del directorio ./directorio.
# Utiliza el comando `free` junto con `awk` para extraer datos específicos.

# Obtiene la memoria RAM total del sistema (columna 2 de la línea 'Mem:')
echo "Memoria RAM total: $(free | tail -2 | head -1 | awk '{print $2}') KB" > ./directorio/info-ram.txt

# Obtiene la memoria libre (columna 4 de la línea 'Mem:')
echo "Memoria libre: $(free | tail -2 | head -1 | awk '{print $4}') KB" >> ./directorio/info-ram.txt

# Obtiene la memoria actualmente ocupada (columna 3 de la línea 'Mem:')
echo "Memoria ocupada: $(free | tail -2 | head -1 | awk '{print $3}') KB" >> ./directorio/info-ram.txt

# Obtiene la memoria disponible para el sistema (columna 7 de la línea 'Mem:')
echo "Memoria disponible: $(free | tail -2 | head -1 | awk '{print $7}') KB" >> ./directorio/info-ram.txt
