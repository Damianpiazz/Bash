#!/bin/bash

menu() {
    echo "Menu de opciones para el comando lprm:"
    echo "1) Eliminar un trabajo de impresión específico"
    echo "2) Eliminar todos los trabajos de impresión"
    echo "3) Eliminar trabajos de impresión de una impresora específica"
    echo "4) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el ID del trabajo de impresión a eliminar: "
            read trabajo_id
            echo "Eliminando el trabajo de impresión con ID '$trabajo_id'..."
            lprm "$trabajo_id"
            ;;
        2)
            echo "Eliminando todos los trabajos de impresión..."
            lprm -o all
            ;;
        3)
            echo -n "Ingrese el nombre de la impresora para eliminar trabajos: "
            read impresora
            echo "Eliminando todos los trabajos de impresión en la impresora '$impresora'..."
            lprm -P "$impresora"
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
