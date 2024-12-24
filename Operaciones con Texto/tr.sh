#!/bin/bash

menu() {
    echo "Menu de opciones para el comando tr:"
    echo "1) Convertir minúsculas a mayúsculas"
    echo "2) Convertir mayúsculas a minúsculas"
    echo "3) Eliminar caracteres específicos"
    echo "4) Reemplazar un conjunto de caracteres por otro"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el texto que desea convertir: "
            read texto
            echo "Convertiendo minúsculas a mayúsculas:"
            echo "$texto" | tr 'a-z' 'A-Z'
            ;;
        2)
            echo -n "Ingrese el texto que desea convertir: "
            read texto
            echo "Convertiendo mayúsculas a minúsculas:"
            echo "$texto" | tr 'A-Z' 'a-z'
            ;;
        3)
            echo -n "Ingrese el texto desde el cual eliminar caracteres: "
            read texto
            echo -n "Ingrese los caracteres que desea eliminar: "
            read eliminar
            echo "Eliminando los caracteres '$eliminar' del texto:"
            echo "$texto" | tr -d "$eliminar"
            ;;
        4)
            echo -n "Ingrese el texto desde el cual reemplazar caracteres: "
            read texto
            echo -n "Ingrese los caracteres a reemplazar (debe ser el mismo número de caracteres): "
            read reemplazar
            echo -n "Ingrese los nuevos caracteres para reemplazar: "
            read nuevos
            echo "Reemplazando '$reemplazar' por '$nuevos' en el texto:"
            echo "$texto" | tr "$reemplazar" "$nuevos"
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
