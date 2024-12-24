#!/bin/bash

menu() {
    echo "Menu de opciones para el comando rm:"
    echo "1) Eliminar un archivo"
    echo "2) Eliminar varios archivos"
    echo "3) Eliminar un directorio vacío"
    echo "4) Eliminar un directorio no vacío"
    echo "5) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo para eliminar: "
            read archivo
            echo "Eliminando el archivo '$archivo'..."
            rm "$archivo"
            ;;
        2)
            echo -n "Ingrese los archivos a eliminar (separados por espacio): "
            read archivos
            echo "Eliminando los archivos '$archivos'..."
            rm $archivos
            ;;
        3)
            echo -n "Ingrese el directorio vacío para eliminar: "
            read directorio
            echo "Eliminando el directorio vacío '$directorio'..."
            rmdir "$directorio"
            ;;
        4)
            echo -n "Ingrese el directorio no vacío para eliminar: "
            read directorio
            echo "Eliminando el directorio no vacío '$directorio' y su contenido..."
            rm -r "$directorio"
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
