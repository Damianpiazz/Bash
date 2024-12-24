#!/bin/bash

menu() {
    echo "Menu de opciones para el comando file:"
    echo "1) Ver el tipo de un archivo"
    echo "2) Ver el tipo de varios archivos"
    echo "3) Ver el tipo de un archivo con detalles completos"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "El tipo de archivo de '$archivo' es:"
            file "$archivo"
            ;;
        2)
            echo -n "Ingrese los nombres de los archivos (separados por espacio): "
            read archivos
            echo "Los tipos de los archivos son:"
            file $archivos
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "El tipo de archivo de '$archivo' con detalles completos es:"
            file -i "$archivo"
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
