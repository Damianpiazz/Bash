#!/bin/bash
# Trabajo Practico Nº 2

# Crear directorio tp2 dentro de ~/documentos/practicas
mkdir -p ~/documentos/practicas/tp2
cd ~/documentos/practicas/tp2

echo "------------------ Punto 1 ------------------"
# Punto 1 - Mostrar mensaje
echo "Estoy aprendiendo lenguaje scripting"

echo "------------------ Punto 2 ------------------"
# Punto 2 - Mostrar espacio disponible en /
clear
disponible=$(df / | tail -1 | awk '{print $4}')
echo "El espacio disponible en el sistema de archivos raíz es : $disponible"

echo "------------------ Punto 3 ------------------"
# Punto 3 - Comparar cantidad de líneas entre 2 archivos (archivos de ejemplo)
echo -e "Linea1\nLinea2\nLinea3" > archivo1.txt
echo -e "Linea1\nLinea2" > archivo2.txt
lineas1=$(wc -l < archivo1.txt)
lineas2=$(wc -l < archivo2.txt)
if [ "$lineas1" -gt "$lineas2" ]; then
    echo "archivo1.txt tiene más líneas"
elif [ "$lineas2" -gt "$lineas1" ]; then
    echo "archivo2.txt tiene más líneas"
else
    echo "Ambos archivos tienen la misma cantidad de líneas"
fi

echo "------------------ Punto 4 ------------------"
# Punto 4 - Comparar cantidad de líneas pasando archivos por parámetro (simulado)
lineas1=$(wc -l < archivo1.txt)
lineas2=$(wc -l < archivo2.txt)
if [ "$lineas1" -gt "$lineas2" ]; then
    echo "archivo1.txt tiene más líneas (con parámetros simulados)"
elif [ "$lineas2" -gt "$lineas1" ]; then
    echo "archivo2.txt tiene más líneas (con parámetros simulados)"
else
    echo "Ambos archivos tienen la misma cantidad de líneas (con parámetros simulados)"
fi

echo "------------------ Punto 5 ------------------"
# Punto 5 - Contar archivos y directorios en tp2
archivos=0
directorios=0
for item in ~/documentos/practicas/tp2/*; do
    if [ -f "$item" ]; then
        ((archivos++))
    elif [ -d "$item" ]; then
        ((directorios++))
    fi
done
echo "Cantidad de archivos en tp2: $archivos"
echo "Cantidad de directorios en tp2: $directorios"

echo "------------------ Punto 6 ------------------"
# Punto 6 - Descomprimir tp1, filtrar ls y comprimir listado
mkdir -p nuevo
cd nuevo
if [ -f ~/practicas/tp1.tar.gz ]; then
    tar -xzvf ~/practicas/tp1.tar.gz
    grep "ls" tp1/hist.txt > listado
    tar -czvf listado.tar.gz listado
else
    echo "tp1.tar.gz no encontrado, salteando punto 6"
fi
cd ..

echo "------------------ Punto 7 ------------------"
# Punto 7 - Dar permisos de escritura a otros en archivos .txt de tp1
if [ -d ~/practicas/tp1 ]; then
    for archivo in ~/practicas/tp1/*.txt; do
        chmod o+w "$archivo"
    done
    echo "Permisos actualizados en archivos .txt de tp1"
else
    echo "Directorio tp1 no encontrado, salteando punto 7"
fi

echo "------------------ Punto 8 ------------------"
# Punto 8 - Extraer UID, GID y shell del usuario admi
if [ -f ~/practicas/tp1/usuarios ]; then
    grep "^admi:" ~/practicas/tp1/usuarios | awk -F: '{print "UID="$3, "GID="$4, "SHELL="$7}' > ~/practicas/tp1/perfil.txt
    echo "Perfil del usuario admi guardado en perfil.txt"
else
    echo "Archivo usuarios no encontrado, salteando punto 8"
fi

echo "------------------ Punto 9 ------------------"
# Punto 9 - Leer /etc/passwd línea por línea
while IFS= read -r linea; do
    echo "$linea"
done < /etc/passwd

echo "------------------ Punto 10 ------------------"
# Punto 10 - Simular alta de usuario
usuario="usu01"
uid=1001
gid=1001
home="/home/$usuario"
shell="/bin/bash"
if [ -f ~/practicas/tp1/usuarios ]; then
    echo "$usuario:x:$uid:$gid::${home}:$shell" >> ~/practicas/tp1/usuarios
    echo "Usuario $usuario agregado al archivo usuarios"
else
    echo "Archivo usuarios no encontrado, salteando punto 10"
fi

echo "Todos los puntos de la Práctica 2 ejecutados."
