#!/bin/bash

# 1) Hacer un script que modifique las palabras "bash" por "sh" 
# que se encuentren en la 3ra línea de los archivos .sh de un 
# directorio pasado por parámetro.

# Sintaxis general del comando sed:
# sed -i 'fila s/inicial/final' archivo

# Recorre todos los archivos con extensión .sh dentro del directorio actual o pasado por parámetro
for file in $(find -type f -name "*.sh"); do
    # Modifica la tercera línea reemplazando "bash" por "sh"
    sed -i '3s/bash/sh/' "$file"
done
