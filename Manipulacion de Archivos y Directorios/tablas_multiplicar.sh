#!/bin/bash

# Descripción: Genera tablas de multiplicar aleatorias para cualquier número entero. 
# La cantidad de iteraciones se pasa como parámetro. 
# Cada tabla se guarda en un archivo llamado "tabla<num>.txt". 
# Tras generar una tabla, se pregunta si desea continuar con otra tabla. 

#El formato y contenido del archivo de salida debe ser asi:

#Tabla del 2

#2 x 0   = 0
#2 x 1   = 2
#2 x 2   = 4
#2 x 3   = 6
#2 x 4   = 8
#2 x 5   = 10
#2 x 6   = 12
#2 x 7   = 14
#2 x 8   = 16
#2 x 9   = 18
#2 x 10  = 20
#2 x 11  = 22
#2 x 12  = 24

# Verificar que se pase un número como parámetro
if [[ ! $1 =~ ^[0-9]+$ ]]; then
    echo "Debe ser numerico"
    exit
fi

# Generar un número aleatorio entre 1 y 100
num=$(( RANDOM % 100 + 1 ))
echo "Tabla del número: $num"

# Generar la tabla de multiplicar hasta la cantidad de iteraciones indicada
for (( i=0; i<=$1; i++ )); do
    op=$((num * i))
    echo "$num x $i = $op"
    echo "$num x $i = $op" >> "tabla$num.txt"
done

# Preguntar si se desea generar otra tabla
read -p "Desea seguir generando tablas de multiplicar? (S/N): " k
if [[ "$k" == "S" || "$k" == "s" ]]; then
    ./tablas_multiplicar.sh "$1"
else
    echo "Fin del script."
    exit
fi