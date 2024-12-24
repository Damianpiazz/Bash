#!/bin/bash

menu() {
    echo "Menu de opciones para el comando uname:"
    echo "1) Mostrar el nombre del sistema operativo"
    echo "2) Mostrar el nombre del nodo del sistema"
    echo "3) Mostrar la versión del sistema operativo"
    echo "4) Mostrar la arquitectura del sistema"
    echo "5) Mostrar información completa del sistema"
    echo "6) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Nombre del sistema operativo:"
            uname -o
            ;;
        2)
            echo "Nombre del nodo del sistema:"
            uname -n
            ;;
        3)
            echo "Versión del sistema operativo:"
            uname -v
            ;;
        4)
            echo "Arquitectura del sistema:"
            uname -m
            ;;
        5)
            echo "Información completa del sistema:"
            uname -a
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
