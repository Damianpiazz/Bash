#!/bin/bash

# Descripcion: Recibe como parametro un directorio y guarda en un archivo los nombres
# de los archivos que tienen permiso de escritura para el grupo y fueron modificados
# en los ultimos 10 dias. Incluye subdirectorios.

# Verificar que se pase un directorio
if [ ! -d "$1" ]; then
    echo "Error: Debe proporcionar un directorio como parametro"
    exit 1
fi

# Archivo de salida
archivo_salida="permisos_grupo_ultimos10dias.txt"

# Buscar archivos con permiso de escritura para el grupo y modificados en los ultimos 10 dias
find "$1" -type f -perm /g=w -mtime -10 > "$archivo_salida"

echo "Busqueda completada. Resultados guardados en $archivo_salida"