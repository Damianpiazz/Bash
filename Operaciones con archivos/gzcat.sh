#!/bin/bash

menu() {
    echo "Menu de opciones para el comando gzcat:"
    echo "1) Ver el contenido de un archivo .gz"
    echo "2) Ver el contenido de varios archivos .gz"
    echo "3) Ver el contenido de un archivo .gz con paginación"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo .gz para ver su contenido: "
            read archivo
            echo "Mostrando el contenido del archivo '$archivo' sin descomprimirlo:"
            gzcat "$archivo"
            ;;
        2)
            echo -n "Ingrese los archivos .gz para ver su contenido (separados por espacio): "
            read archivos
            echo "Mostrando el contenido de los archivos '$archivos' sin descomprimirlos:"
            gzcat $archivos
            ;;
        3)
            echo -n "Ingrese el archivo .gz para ver su contenido con paginación: "
            read archivo
            echo "Mostrando el contenido del archivo '$archivo' con paginación:"
            gzcat "$archivo" | less
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
