#!/bin/bash

menu() {
    echo "Menu de opciones para el comando df:"
    echo "1) Mostrar el uso de espacio en disco de todos los sistemas de archivos"
    echo "2) Mostrar el uso de espacio en disco en un formato legible (human readable)"
    echo "3) Mostrar el uso de espacio en disco de un directorio específico"
    echo "4) Mostrar el uso de espacio de un sistema de archivos específico"
    echo "5) Mostrar el uso de espacio de todos los sistemas de archivos con inodos"
    echo "6) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Uso de espacio en disco de todos los sistemas de archivos:"
            df
            ;;
        2)
            echo "Uso de espacio en disco en un formato legible (human readable):"
            df -h
            ;;
        3)
            echo -n "Ingrese el directorio para ver su uso de espacio (por ejemplo: /home): "
            read directorio
            echo "Uso de espacio en disco para el directorio '$directorio':"
            df $directorio
            ;;
        4)
            echo -n "Ingrese el sistema de archivos para ver su uso de espacio (por ejemplo: /dev/sda1): "
            read sistema_archivos
            echo "Uso de espacio en disco para el sistema de archivos '$sistema_archivos':"
            df $sistema_archivos
            ;;
        5)
            echo "Uso de espacio de todos los sistemas de archivos con inodos:"
            df -i
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
