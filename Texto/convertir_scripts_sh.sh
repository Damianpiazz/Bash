#!/bin/bash

# Verificar si la ruta proporcionada como parámetro es la esperada
if [ "$(realpath $1)" != "/home/damip/Escritorio/Bash" ]
then
    echo "Debe ingresar la carpeta tp2 como parametros"
    exit  # Finaliza el script si el parámetro no es válido
fi

# Crear el directorio de destino si no existe
mkdir -p scripts-sh

# Recorrer todos los archivos dentro del directorio recibido como parámetro
for item in $1/*
do
    # Verificar que el elemento sea un archivo
    if [ -f "$item" ]
    then
        # Reemplazar todas las apariciones de "bash" por "sh"
        # y guardar el resultado en la carpeta scripts-sh con sufijo -mod.sh
        sed "s/bash/sh/g" $item > scripts-sh/$(basename $item .sh)-mod.sh
    fi
done

# Ejemplo adicional: reemplazo solo en la primera línea del archivo
sed "1s/bash/sh/g" $item > scripts-sh/$(basename $item .sh)-mod.sh

# Ejemplo adicional: reemplazo entre las líneas 1 y 3
sed "1,3s/bash/sh/g" $item > scripts-sh/$(basename $item .sh)-mod.sh