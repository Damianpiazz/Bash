#!/bin/bash

menu() {
    echo "Menu de opciones para el comando nl:"
    echo "1) Numerar las líneas de un archivo"
    echo "2) Numerar las líneas de un archivo con un formato específico"
    echo "3) Numerar las líneas de un texto ingresado por el usuario"
    echo "4) Numerar las líneas de un archivo sin mostrar las líneas vacías"
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
            echo "Numerando las líneas del archivo '$archivo':"
            nl "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el formato (por ejemplo, 't', 'l', 'n', etc.): "
            read formato
            echo "Numerando las líneas del archivo '$archivo' con formato '$formato':"
            nl -"$formato" "$archivo"
            ;;
        3)
            echo -n "Ingrese el texto que desea numerar: "
            read texto
            echo "Numerando las líneas del texto:"
            echo "$texto" | nl
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Numerando las líneas del archivo '$archivo', excluyendo las líneas vacías:"
            nl -b a "$archivo"
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
