#!/bin/bash

# Descripción:
# Este script muestra la información del uso de disco del sistema utilizando el comando `df -h`.
# Luego extrae el espacio disponible específicamente del sistema de archivos raíz ("/")
# y lo muestra en pantalla de manera legible para el usuario.

# Limpiar la pantalla antes de mostrar la información
clear

# Mostrar encabezado informativo
echo "Información del uso en disco"
echo ""

# Ejecutar el comando df para ver el uso de disco en formato legible (-h)
df -h
echo ""

# Buscar en la salida del comando anterior el espacio disponible del sistema de archivos raíz
espacio_disponible=$(df -h | grep -w "/" | awk '{print $4}')

# Mostrar un mensaje con el espacio disponible del sistema raíz
echo "El espacio disponible en el sistema de archivos raíz es: $espacio_disponible"
echo ""

# Esperar a que el usuario presione una tecla para continuar
read -rp "Presione cualquier tecla para continuar..."
