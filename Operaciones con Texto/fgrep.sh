#!/bin/bash

menu() {
    echo "Menu de opciones para el comando fgrep:"
    echo "1) Buscar una cadena literal en un archivo"
    echo "2) Buscar una cadena literal en múltiples archivos"
    echo "3) Buscar una cadena literal ignorando mayúsculas y minúsculas"
    echo "4) Buscar una cadena exacta en el archivo"
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
            echo -n "Ingrese la cadena literal que desea buscar: "
            read cadena
            echo "Buscando la cadena '$cadena' en el archivo '$archivo':"
            fgrep "$cadena" "$archivo"
            ;;
        2)
            echo -n "Ingrese la cadena literal que desea buscar: "
            read cadena
            echo -n "Ingrese los nombres de los archivos (separados por espacios): "
            read archivos
            echo "Buscando la cadena '$cadena' en los archivos '$archivos':"
            fgrep "$cadena" $archivos
            ;;
        3)
            echo -n "Ingrese la cadena literal que desea buscar: "
            read cadena
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando la cadena '$cadena' en el archivo '$archivo', ignorando mayúsculas y minúsculas:"
            fgrep -i "$cadena" "$archivo"
            ;;
        4)
            echo -n "Ingrese la cadena exacta que desea buscar: "
            read cadena
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Buscando la cadena exacta '$cadena' en el archivo '$archivo':"
            fgrep -Fx "$cadena" "$archivo"
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
