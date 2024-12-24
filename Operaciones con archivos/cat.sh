#!/bin/bash

menu() {
    echo "Menu de opciones para el comando cat:"
    echo "1) Mostrar el contenido de un archivo"
    echo "2) Concatenar dos archivos y mostrar el resultado"
    echo "3) Concatenar dos archivos y guardarlos en un archivo nuevo"
    echo "4) Mostrar el contenido de un archivo con número de línea"
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
            echo "Mostrando el contenido del archivo '$archivo':"
            cat "$archivo"
            ;;
        2)
            echo -n "Ingrese el primer archivo: "
            read archivo1
            echo -n "Ingrese el segundo archivo: "
            read archivo2
            echo "Concatenando los archivos '$archivo1' y '$archivo2' y mostrando el resultado:"
            cat "$archivo1" "$archivo2"
            ;;
        3)
            echo -n "Ingrese el primer archivo: "
            read archivo1
            echo -n "Ingrese el segundo archivo: "
            read archivo2
            echo -n "Ingrese el nombre del archivo de salida: "
            read salida
            echo "Concatenando los archivos '$archivo1' y '$archivo2' y guardando el resultado en '$salida':"
            cat "$archivo1" "$archivo2" > "$salida"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Mostrando el contenido del archivo '$archivo' con número de línea:"
            cat -n "$archivo"
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
