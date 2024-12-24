#!/bin/bash

menu() {
    echo "Menu de opciones para el comando ls:"
    echo "1) Listar archivos y directorios del directorio actual"
    echo "2) Listar archivos y directorios con detalles (modo largo)"
    echo "3) Listar archivos con detalles y permisos"
    echo "4) Listar todos los archivos, incluidos los ocultos"
    echo "5) Listar archivos de un directorio específico"
    echo "6) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Listando los archivos y directorios del directorio actual:"
            ls
            ;;
        2)
            echo "Listando los archivos y directorios con detalles (modo largo):"
            ls -l
            ;;
        3)
            echo "Listando los archivos con detalles y permisos:"
            ls -l
            ;;
        4)
            echo "Listando todos los archivos, incluidos los ocultos:"
            ls -a
            ;;
        5)
            echo -n "Ingrese el directorio para listar los archivos: "
            read directorio
            echo "Listando los archivos y directorios de '$directorio':"
            ls "$directorio"
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
