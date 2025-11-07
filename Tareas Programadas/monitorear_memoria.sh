#!/bin/bash

# Este script registra cada 23 minutos la cantidad de memoria usada y libre del sistema.
# Los valores se guardan en un archivo llamado "informe.txt" dentro del directorio especificado.
# 
# La información se obtiene usando el comando `free -m`, que muestra la memoria en megabytes.
# Se utiliza `awk` para extraer las columnas de memoria usada y libre.
# 
# El script puede programarse con `crontab` para ejecutarse automáticamente cada 23 minutos.

# REGISTRAR MEMORIA USADA
echo "Usado: $(free -m | tail -n +2 | head -1 | awk '{print $3}')" >> "./directorio/informe.txt"

# REGISTRAR MEMORIA LIBRE
echo "Libre: $(free -m | tail -n +2 | head -1 | awk '{print $4}')" >> "./directorio/informe.txt"

# CONFIGURACIÓN DE CRONTAB
# Para editar las tareas programadas: crontab -e
#
# Formato: minuto hora día(mes) mes día(semana)
# Ejecutar este script cada 23 minutos:
# */23 * * * * /ruta/absoluta/monitorear_memoria.sh
