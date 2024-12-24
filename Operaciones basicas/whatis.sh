#!/bin/bash

menu() {
    echo "Menu de opciones para el comando whatis:"
    echo "1) Obtener descripción de un comando"
    echo "2) Buscar descripciones de múltiples comandos"
    echo "3) Buscar descripciones con más detalles (usando apropos)"
    echo "4) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el comando para obtener su descripción: "
            read comando
            echo "Descripción de '$comando':"
            whatis "$comando"
            ;;
        2)
            echo -n "Ingrese los comandos para obtener sus descripciones (separados por espacio): "
            read comandos
            for comando in $comandos; do
                echo "Descripción de '$comando':"
                whatis "$comando"
            done
            ;;
        3)
            echo -n "Ingrese un término para buscar en las descripciones de los comandos: "
            read termino
            echo "Buscando descripciones de comandos con '$termino'..."
            apropos "$termino"
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
