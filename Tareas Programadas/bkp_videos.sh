#!/bin/bash

# Script que busca en un directorio pasado por parámetro todos los archivos con
# extensión .mp4 cuyo tamaño sea mayor a 5 MB, los copia a una carpeta de respaldo,
# y luego genera un archivo comprimido (.tar.gz) cuyo nombre incluye la fecha actual
# en formato bkp_AAAA_MM_DD.tar.gz.
# Además, se sugiere su ejecución automática todos los domingos a las 5:00 AM mediante crontab.

# Verificación de parámetro: debe pasarse un directorio
if [ -z "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

# Crear la carpeta de respaldo si no existe
mkdir -p "./directorio/bkp/"

# Buscar archivos .mp4 mayores a 5 MB en el directorio indicado
# y copiarlos a la carpeta de respaldo
for file in $(find "$1" -type f -name "*.mp4" -size +5M); do
    cp "$file" "./directorio/bkp/"
done

# Crear archivo comprimido con la fecha actual en el nombre
tar -czf "./directorio/bkp_$(date +%Y_%m_%d).tar.gz" "./directorio/bkp/"

# Instrucción para programar el script en crontab:
# Ejecutar todos los domingos a las 5:00 AM
# Formato: minuto hora día(mes) mes día(semana)
# Ejemplo:
# 0 5 * * 0 /ruta/absoluta/bkp_videos.sh /ruta/del/directorio
