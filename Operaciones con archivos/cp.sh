#!/bin/bash

menu() {
    echo "Menu de opciones para el comando cp:"
    echo "1) Copiar un archivo a otro archivo"
    echo "2) Copiar un archivo a un directorio"
    echo "3) Copiar un directorio y su contenido de manera recursiva"
    echo "4) Copiar un archivo y preservar atributos"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo origen: "
            read archivo_origen
            echo -n "Ingrese el archivo destino: "
            read archivo_destino
            echo "Copiando el archivo '$archivo_origen' a '$archivo_destino':"
            cp "$archivo_origen" "$archivo_destino"
            ;;
        2)
            echo -n "Ingrese el archivo origen: "
            read archivo_origen
            echo -n "Ingrese el directorio destino: "
            read directorio_destino
            echo "Copiando el archivo '$archivo_origen' al directorio '$directorio_destino':"
            cp "$archivo_origen" "$directorio_destino"
            ;;
        3)
            echo -n "Ingrese el directorio origen: "
            read directorio_origen
            echo -n "Ingrese el directorio destino: "
            read directorio_destino
            echo "Copiando el directorio '$directorio_origen' y su contenido al directorio '$directorio_destino' de manera recursiva:"
            cp -R "$directorio_origen" "$directorio_destino"
            ;;
        4)
            echo -n "Ingrese el archivo origen: "
            read archivo_origen
            echo -n "Ingrese el archivo destino: "
            read archivo_destino
            echo "Copiando el archivo '$archivo_origen' a '$archivo_destino' y preservando atributos (como fechas de modificación):"
            cp -p "$archivo_origen" "$archivo_destino"
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
