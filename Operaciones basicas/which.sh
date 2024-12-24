#!/bin/bash

menu() {
    echo "Menu de opciones para el comando which:"
    echo "1) Encontrar la ubicación de un comando"
    echo "2) Ver si un comando está en el PATH"
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
            which "$comando"
            ;;
        2)
            echo -n "Ingrese el comando para verificar si está en el PATH: "
            read comando
            which "$comando" > /dev/null
            if [ $? -eq 0 ]; then
                echo "'$comando' está en el PATH."
            else
                echo "'$comando' NO está en el PATH."
            fi
            ;;
        3)
            echo -n "Ingrese los comandos a buscar (separados por espacio): "
            read comandos
            for comando in $comandos; do
                echo "La ubicación de '$comando' es:"
                which "$comando"
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
