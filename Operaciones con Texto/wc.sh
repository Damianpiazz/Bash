#!/bin/bash

menu() {
    echo "Menu de opciones para el comando wc:"
    echo "1) Contar las líneas de un archivo"
    echo "2) Contar las palabras de un archivo"
    echo "3) Contar los caracteres de un archivo"
    echo "4) Contar las líneas, palabras y caracteres de un archivo"
    echo "5) Contar las líneas, palabras y caracteres de un texto ingresado"
    echo "6) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Contando las líneas del archivo '$archivo':"
            wc -l "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Contando las palabras del archivo '$archivo':"
            wc -w "$archivo"
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Contando los caracteres del archivo '$archivo':"
            wc -m "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Contando las líneas, palabras y caracteres del archivo '$archivo':"
            wc "$archivo"
            ;;
        5)
            echo -n "Ingrese el texto que desea analizar: "
            read texto
            echo "Contando las líneas, palabras y caracteres del texto ingresado:"
            echo "$texto" | wc
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
