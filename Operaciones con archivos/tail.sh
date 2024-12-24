#!/bin/bash

menu() {
    echo "Menu de opciones para el comando tail:"
    echo "1) Mostrar las últimas 10 líneas de un archivo"
    echo "2) Mostrar un número personalizado de líneas de un archivo"
    echo "3) Mostrar las últimas 10 líneas de varios archivos"
    echo "4) Mostrar las últimas líneas de un archivo en tiempo real"
    echo "5) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo para mostrar las últimas 10 líneas: "
            read archivo
            echo "Mostrando las últimas 10 líneas del archivo '$archivo':"
            tail "$archivo"
            ;;
        2)
            echo -n "Ingrese el archivo para mostrar las últimas líneas: "
            read archivo
            echo -n "Ingrese el número de líneas a mostrar: "
            read lineas
            echo "Mostrando las últimas $lineas líneas del archivo '$archivo':"
            tail -n "$lineas" "$archivo"
            ;;
        3)
            echo -n "Ingrese los archivos para mostrar las últimas 10 líneas (separados por espacio): "
            read archivos
            echo "Mostrando las últimas 10 líneas de los archivos '$archivos':"
            tail $archivos
            ;;
        4)
            echo -n "Ingrese el archivo para mostrar las últimas líneas en tiempo real: "
            read archivo
            echo "Mostrando las últimas líneas del archivo '$archivo' en tiempo real:"
            tail -f "$archivo"
            ;;
        5)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
