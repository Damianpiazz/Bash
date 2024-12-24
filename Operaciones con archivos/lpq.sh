#!/bin/bash

menu() {
    echo "Menu de opciones para el comando lpq:"
    echo "1) Ver la cola de impresión"
    echo "2) Ver el estado de la impresora"
    echo "3) Ver los trabajos de impresión pendientes en una impresora específica"
    echo "4) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando la cola de impresión actual:"
            lpq
            ;;
        2)
            echo -n "Ingrese el nombre de la impresora para ver su estado: "
            read impresora
            echo "Mostrando el estado de la impresora '$impresora':"
            lpstat -p "$impresora"
            ;;
        3)
            echo -n "Ingrese el nombre de la impresora para ver los trabajos pendientes: "
            read impresora
            echo "Mostrando los trabajos pendientes en la impresora '$impresora':"
            lpq -P "$impresora"
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
