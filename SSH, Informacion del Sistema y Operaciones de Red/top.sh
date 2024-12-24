#!/bin/bash

menu() {
    echo "Menu de opciones para el comando top:"
    echo "1) Mostrar los procesos con uso de CPU y memoria"
    echo "2) Mostrar procesos ordenados por uso de CPU"
    echo "3) Mostrar procesos ordenados por uso de memoria"
    echo "4) Mostrar la información de recursos en tiempo real"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando los procesos con uso de CPU y memoria:"
            top -n 1
            ;;
        2)
            echo "Mostrando procesos ordenados por uso de CPU:"
            top -n 1 -o %CPU
            ;;
        3)
            echo "Mostrando procesos ordenados por uso de memoria:"
            top -n 1 -o %MEM
            ;;
        4)
            echo "Mostrando la información de recursos en tiempo real (presiona q para salir):"
            top
            ;;
        5)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
