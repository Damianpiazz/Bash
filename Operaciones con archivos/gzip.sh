#!/bin/bash

menu() {
    echo "Menu de opciones para el comando gzip:"
    echo "1) Comprimir un archivo"
    echo "2) Comprimir varios archivos"
    echo "3) Comprimir un archivo manteniendo el archivo original"
    echo "4) Ver el contenido de un archivo comprimido"
    echo "5) Descomprimir un archivo .gz"
    echo "6) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo a comprimir: "
            read archivo
            echo "Comprimiendo el archivo '$archivo':"
            gzip "$archivo"
            ;;
        2)
            echo -n "Ingrese los archivos a comprimir (separados por espacio): "
            read archivos
            echo "Comprimiendo los archivos '$archivos':"
            gzip $archivos
            ;;
        3)
            echo -n "Ingrese el archivo a comprimir manteniendo el original: "
            read archivo
            echo "Comprimiendo el archivo '$archivo' y manteniendo el archivo original:"
            gzip -c "$archivo" > "$archivo.gz"
            ;;
        4)
            echo -n "Ingrese el archivo .gz para ver su contenido: "
            read archivo
            echo "Mostrando el contenido del archivo '$archivo' sin descomprimirlo:"
            gzcat "$archivo"
            ;;
        5)
            echo -n "Ingrese el archivo .gz a descomprimir: "
            read archivo
            echo "Descomprimiendo el archivo '$archivo':"
            gunzip "$archivo"
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
