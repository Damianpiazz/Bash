#!/bin/bash

menu() {
    echo "Menu de opciones para el comando uptime:"
    echo "1) Mostrar el tiempo de actividad del sistema"
    echo "2) Mostrar el tiempo de actividad con la carga promedio"
    echo "3) Mostrar el tiempo de actividad de forma detallada"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando el tiempo de actividad del sistema:"
            uptime -p
            ;;
        2)
            echo "Mostrando el tiempo de actividad con la carga promedio:"
            uptime
            ;;
        3)
            echo "Mostrando el tiempo de actividad de forma detallada:"
            uptime -s
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
