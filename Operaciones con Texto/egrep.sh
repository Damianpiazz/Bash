#!/bin/bash

menu() {
    echo "Menu de opciones para el comando egrep:"
    echo "1) Buscar un patrón en un archivo"
    echo "2) Buscar un patrón usando expresiones regulares"
    echo "3) Buscar un patrón en múltiples archivos"
    echo "4) Buscar un patrón e ignorar mayúsculas y minúsculas"
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
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo "Buscando el patrón '$patron' en el archivo '$archivo':"
            egrep "$patron" "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patrón con expresión regular que desea buscar: "
            read patron
            echo "Buscando el patrón '$patron' en el archivo '$archivo' con expresión regular:"
            egrep -E "$patron" "$archivo"
            ;;
        3)
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo -n "Ingrese los nombres de los archivos (separados por espacios): "
            read archivos
            echo "Buscando el patrón '$patron' en los archivos '$archivos':"
            egrep "$patron" $archivos
            ;;
        4)
            echo -n "Ingrese el patrón que desea buscar: "
            read patron
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando el patrón '$patron' en el archivo '$archivo', ignorando mayúsculas y minúsculas:"
            egrep -i "$patron" "$archivo"
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
