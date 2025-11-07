#!/bin/bash

# Descripción:
# Este script permite visualizar el estado actual de la memoria del sistema
# y luego seleccionar el nivel de liberación de memoria caché en Linux.
# Usa el archivo del kernel /proc/sys/vm/drop_caches para liberar:
#   1 → pagecache
#   2 → dentries e inodes
#   3 → ambos (pagecache + dentries + inodes)

# Guarda un informe actual del estado de la memoria en un archivo de texto
vmstat > "mem-actual.txt"

# Muestra un menú informativo con las opciones disponibles
echo "Selecciona el nivel de liberación de memoria"
echo "0. No liberar nada"
echo "1. Liberar pagecache"
echo "2. Liberar inodos y dentries"
echo "3. Liberar pagecache, inodos y dentries"

# Solicita al usuario que ingrese un nivel de liberación entre 0 y 3
read -p "Ingresar el nivel (0-3): " nivel

# Evalúa la opción ingresada y ejecuta el comando correspondiente
case $nivel in
    0)
        # No realiza ninguna acción
        echo "No se liberará memoria."
        ;;
    1)
        # Libera la memoria caché de páginas
        echo "Liberando pagecache..."
        sudo sh -c "echo 1 > /proc/sys/vm/drop_caches"
        ;;
    2)
        # Libera los inodos y dentries (estructuras del sistema de archivos)
        echo "Liberando inodos y dentries..."
        sudo sh -c "echo 2 > /proc/sys/vm/drop_caches"
        ;;
    3)
        # Libera tanto pagecache como inodos y dentries
        echo "Liberando pagecache, inodos y dentries..."
        sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"
        ;;
    *)
        # Si la opción no es válida, el script finaliza con error
        echo "Opción no válida. Saliendo."
        exit 1
        ;;
esac
