#!/bin/bash

# Este script verifica si un usuario específico (pasado como parámetro)
# se conectó al sistema durante el mes actual.
# Usa el comando `last` para consultar el historial de inicios de sesión
# y compara los registros con el mes en curso.
#
# Puede programarse en `crontab` para ejecutarse automáticamente los lunes y jueves.

# VERIFICAR QUE SE PASE UN USUARIO COMO PARÁMETRO
if [ -z "$1" ]; then
    echo "Uso: $0 <Usuario>"
    exit 1
fi

# OBTENER EL MES ACTUAL (ejemplo: Nov, Dic, Ene, etc.)
mes=$(date +"%b")

# VERIFICAR SI EL USUARIO SE CONECTÓ EN EL MES ACTUAL
if [ -n "$(last -F "$1" | grep -i "$mes")" ]; then
    echo "$1 se conectó este mes."
else
    echo "$1 no se conectó este mes."
fi

# CONFIGURACIÓN CRONTAB
# Para editar tareas programadas: crontab -e
#
# Formato: minuto hora día(mes) mes día(semana)
# Ejecutar este script los lunes (1) y jueves (4):
# * * * * 1,4 /home/damip/conexion.sh damip
