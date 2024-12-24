#!/bin/bash

menu() {
    echo "Menu de opciones para el comando mv:"
    echo "1) Mover un archivo a otro directorio"
    echo "2) Renombrar un archivo"
    echo "3) Mover varios archivos a un directorio"
    echo "4) Mover un directorio a otro directorio"
    echo "5) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo a mover: "
            read archivo
            echo -n "Ingrese el directorio de destino: "
            read destino
            echo "Moviendo el archivo '$archivo' a '$destino'..."
            mv "$archivo" "$destino"
            ;;
        2)
            echo -n "Ingrese el archivo para renombrar: "
            read archivo
            echo -n "Ingrese el nuevo nombre del archivo: "
            read nuevo_nombre
            echo "Renombrando '$archivo' a '$nuevo_nombre'..."
            mv "$archivo" "$nuevo_nombre"
            ;;
        3)
            echo -n "Ingrese los archivos a mover (separados por espacio): "
            read archivos
            echo -n "Ingrese el directorio de destino: "
            read destino
            echo "Moviendo los archivos '$archivos' a '$destino'..."
            mv $archivos "$destino"
            ;;
        4)
            echo -n "Ingrese el directorio a mover: "
            read directorio
            echo -n "Ingrese el directorio de destino: "
            read destino
            echo "Moviendo el directorio '$directorio' a '$destino'..."
            mv "$directorio" "$destino"
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
