#!/bin/bash

menu() {
    echo "Menu de opciones para el comando uniq:"
    echo "1) Eliminar líneas duplicadas de un archivo"
    echo "2) Contar las ocurrencias de las líneas duplicadas"
    echo "3) Eliminar las líneas duplicadas de un archivo y mantener solo una"
    echo "4) Mostrar las líneas duplicadas de un archivo"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Eliminando las líneas duplicadas en el archivo '$archivo':"
            sort "$archivo" | uniq
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Contando las ocurrencias de las líneas duplicadas en el archivo '$archivo':"
            sort "$archivo" | uniq -c
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Eliminando las líneas duplicadas y manteniendo solo una en el archivo '$archivo':"
            sort "$archivo" | uniq -u
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Mostrando las líneas duplicadas en el archivo '$archivo':"
            sort "$archivo" | uniq -d
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
