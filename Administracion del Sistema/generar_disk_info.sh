#!/bin/bash

# Descripción: 
# Este script genera un archivo llamado "DISK.txt" dentro del directorio "./directorio"
# que contiene el porcentaje de uso de las particiones raíz (/) y /boot (o /boot/efi).
# Verifica y guarda los valores utilizando los comandos `df` y `awk`.

# Verifica si el directorio existe; si no, lo crea
if [ ! -d "./directorio" ]; then
    mkdir -p "./directorio"
fi

# Obtiene el porcentaje de uso de la partición raíz (/)
# `df /` muestra información del sistema de archivos raíz
# `tail -1` toma la última línea del resultado (que contiene los datos numéricos)
# `awk '{print $5}'` extrae el quinto campo (el porcentaje de uso)
porcentaje_root=$(df / | tail -1 | awk '{print $5}')

# Obtiene el porcentaje de uso de la partición /boot o /boot/efi
# `df /boot/efi` muestra la información de la partición donde está montado el arranque
# Se utiliza `tail -1` y `awk` igual que antes para obtener el porcentaje de uso
porcentaje_boot=$(df /boot/efi | tail -1 | awk '{print $5}')

# Crea o sobrescribe el archivo "DISK.txt" con los datos obtenidos
echo "Porcentaje de uso de / : $porcentaje_root" > ./directorio/DISK.txt
echo "Porcentaje de uso de /boot : $porcentaje_boot" >> ./directorio/DISK.txt

# Mensaje informativo al finalizar
echo "Archivo 'DISK.txt' generado correctamente en ./directorio/"
