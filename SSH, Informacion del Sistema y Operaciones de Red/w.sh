#!/bin/bash

menu() {
    echo "Menu de opciones para el comando w:"
    echo "1) Mostrar información sobre los usuarios conectados"
    echo "2) Mostrar información detallada sobre los usuarios conectados"
    echo "3) Mostrar los procesos de los usuarios conectados"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando información sobre los usuarios conectados:"
            w
            ;;
        2)
            echo "Mostrando información detallada sobre los usuarios conectados:"
            w -i
            ;;
        3)
            echo "Mostrando los procesos de los usuarios conectados:"
            w -p
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
