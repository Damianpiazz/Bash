#!/bin/bash

menu() {
    echo "Menu de opciones para el comando touch:"
    echo "1) Crear un archivo vacío"
    echo "2) Crear varios archivos vacíos"
    echo "3) Actualizar la fecha de modificación de un archivo"
    echo "4) Crear un archivo con un nombre específico"
    echo "5) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo para crear: "
            read archivo
            echo "Creando el archivo '$archivo'..."
            touch "$archivo"
            ;;
        2)
            echo -n "Ingrese los nombres de los archivos a crear (separados por espacio): "
            read archivos
            echo "Creando los archivos '$archivos'..."
            touch $archivos
            ;;
        3)
            echo -n "Ingrese el archivo para actualizar la fecha de modificación: "
            read archivo
            echo "Actualizando la fecha de modificación de '$archivo'..."
            touch "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo (con extensión) a crear: "
            read archivo
            echo "Creando el archivo '$archivo'..."
            touch "$archivo"
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
