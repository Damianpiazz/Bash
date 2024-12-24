#!/bin/bash

menu() {
    echo "Menu de opciones para el comando lpr:"
    echo "1) Enviar un archivo a la impresora predeterminada"
    echo "2) Enviar un archivo a una impresora específica"
    echo "3) Enviar un archivo a la impresora con opciones adicionales"
    echo "4) Salir"
    echo -n "Seleccione una opción: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo para enviar a la impresora predeterminada: "
            read archivo
            echo "Enviando el archivo '$archivo' a la impresora predeterminada..."
            lpr "$archivo"
            ;;
        2)
            echo -n "Ingrese el archivo para enviar a la impresora: "
            read archivo
            echo -n "Ingrese el nombre de la impresora: "
            read impresora
            echo "Enviando el archivo '$archivo' a la impresora '$impresora'..."
            lpr -P "$impresora" "$archivo"
            ;;
        3)
            echo -n "Ingrese el archivo para enviar a la impresora: "
            read archivo
            echo -n "Ingrese el nombre de la impresora: "
            read impresora
            echo -n "Ingrese opciones adicionales (por ejemplo, -#2 para copias): "
            read opciones
            echo "Enviando el archivo '$archivo' a la impresora '$impresora' con opciones '$opciones'..."
            lpr -P "$impresora" $opciones "$archivo"
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
