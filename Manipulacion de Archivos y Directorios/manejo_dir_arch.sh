#!/bin/bash

# Descripción: Permite al usuario elegir entre analizar un directorio o manipular un archivo.
# - En caso de directorio: calcula el tamaño más pequeño de los archivos y cuenta cuántos tienen permisos 644.
# - En caso de archivo: cambia permisos, copia el archivo, genera una versión modificada y muestra contenido.

# Mostrar opciones al usuario
echo "1) Directorio"
echo "2) Archivo"

# Leer opción del usuario
read -p "Opcion: " k

# Inicializar contador
con=0

case $k in
1)
    # Opción 1: Procesar directorio
    read -p "Directorio: " dir
    if [ -d $dir ]; then
        # Obtener tamaño inicial del directorio en KB
        tam=$(( $(stat -c %s "$dir") / 1024))
        # Iterar sobre cada archivo en el directorio
        for item in "$dir"/*; do
            aux=$(($(stat -c %s "$item") / 1024))
            # Actualizar tamaño mínimo
            if [ $aux -lt $tam ]; then
                tam=$aux
            fi
            # Contar archivos con permisos 644
            perm=$(stat -c "%a" "$item")
            if [ "$perm" -eq 644 ]; then
                con=$((con + 1))
            fi
        done
        # Mostrar resultados
        echo "Tamaño menor: $tam KB"
        echo "Cantidad de archivos con permisos 644: $con"
    else
        echo "Debe ser directorio"
    fi
;;
2)
    # Opción 2: Procesar archivo
    read -p "Archivo: " arc
    # Cambiar permisos del archivo
    chmod 766 "$arc"
    # Copiar archivo original
    cat "$arc" > "archivo_copiado"
    # Calcular líneas menos las últimas 5
    val=$(wc -l < "$arc")
    val=$((val - 5))
    lin=$(head -n "$val" "$arc")
    # Crear archivo modificado
    cat "$arc" > "$(basename $arc)-mod"
    # Mostrar contenidos
    echo "Contenido completo del archivo original:"
    echo "$(cat archivo_copiado)"
    echo "Contenido sin las últimas 5 líneas:"
    echo "$lin"
    echo "Contenido del archivo modificado:"
    path="$(basename "$arc")-mod"
    echo "$(cat $path)"
;;
*)
    # Opción no válida
    echo "Opción incorrecta"
;;
esac
