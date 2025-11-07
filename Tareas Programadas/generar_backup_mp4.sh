#!/bin/bash

# Este script crea un respaldo comprimido (.tar.gz) con todos los archivos .mp4
# mayores a 5 MB encontrados dentro de un directorio especificado por parámetro.
# El archivo de respaldo se guarda en /tmp y lleva en su nombre la fecha actual (dd_mm_yy).
# Puede configurarse para ejecutarse automáticamente los domingos a las 5:00 AM mediante crontab.

# Verificar que el parámetro pasado sea un directorio válido
if [ ! -d "$1" ]; then
    echo "Uso: $0 <directorio>"
    exit 1
fi

# Crear el archivo comprimido con los archivos .mp4 mayores a 5 MB del directorio indicado
# El respaldo se almacena en /tmp con un nombre que incluye la fecha actual
tar -czf /tmp/bkp_$(date "+%d_%m_%y").tar.gz $(find "$1" -name "*.mp4" -size +5M)

# Instrucción para automatizar la ejecución con crontab
# Abrir el editor de tareas programadas:
# crontab -e

# Formato: minuto hora día(mes) mes día(semana) /ruta/absoluta/script /ruta/del/directorio
# Ejemplo para ejecutarlo todos los domingos a las 5:00 AM:
# 0 5 * * 0 /home/damip/generar_backup_mp4.sh /home/
