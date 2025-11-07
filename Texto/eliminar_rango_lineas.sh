#!/bin/bash

# Verifica que el primer parámetro sea un archivo existente
if [ ! -f "$1" ]
then
    echo "Debe ingresar un archivo como parametro"
    exit  # Finaliza la ejecución si no se pasa un archivo válido
fi

# Solicita al usuario el rango de líneas a eliminar
read -p "Ingresar el primer valor del rango: " num1
read -p "Ingresar el segundo valor del rango: " num2

# Calcula la diferencia entre los números ingresados (rango)
let rango=num2-num1

# Verifica si el archivo tiene al menos la cantidad de líneas necesarias
if [ $(wc -l $1 | cut -d" " -f1) -ge $rango ]
then
    # Elimina las líneas comprendidas entre num1 y num2 (sin modificar el archivo original)
    sed "$num1,$num2 d" $1
fi