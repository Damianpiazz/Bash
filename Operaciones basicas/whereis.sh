#!/bin/bash

menu() {
    echo "Menu de opciones para el comando whereis:"
    echo "1) Encontrar la ubicación de un comando"
    echo "2) Buscar las ubicaciones de un comando con detalles (binarios, fuentes, manuales)"
    echo "3) Buscar múltiples comandos"
    echo "4) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el comando para encontrar su ubicación: "
            read comando
            echo "La ubicación de '$comando' es:"
            whereis "$comando"
            ;;
        2)
            echo -n "Ingrese el comando para buscar las ubicaciones (binarios, fuentes, manuales): "
            read comando
            echo "Buscando detalles de '$comando'..."
            whereis -b -m -s "$comando"
            ;;
        3)
            echo -n "Ingrese los comandos a buscar (separados por espacio): "
            read comandos
            for comando in $comandos; do
                echo "Buscando detalles de '$comando'..."
                whereis "$comando"
            done
            ;;
        4)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
