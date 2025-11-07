#!/bin/bash

# Verifica que el parámetro ingresado sea un archivo válido
if [ ! -f "$1" ];
then
	echo "Debe ser archivo"
	exit  # Finaliza el script si el parámetro no es un archivo
fi

# Cuenta la cantidad de líneas del archivo
lin=$(wc -l < $1)

# Si el archivo tiene más de 4 líneas, reemplaza "bash" por "Linux" de la línea 1 a la 4
if [ $lin -gt 4 ];
then
	sed -i '1,4 s/bash/Linux/g' "$1"  # Modifica el archivo directamente
fi