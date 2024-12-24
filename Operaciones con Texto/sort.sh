#!/bin/bash

menu() {
    echo "Menu de opciones para el comando sort:"
    echo "1) Ordenar un archivo de manera ascendente"
    echo "2) Ordenar un archivo de manera descendente"
    echo "3) Ordenar un archivo numéricamente"
    echo "4) Ordenar un archivo ignorando mayúsculas y minúsculas"
    echo "5) Ordenar un archivo y guardar los resultados en un nuevo archivo"
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
            echo "Ordenando las líneas del archivo '$archivo' de manera ascendente:"
            sort "$archivo"
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Ordenando las líneas del archivo '$archivo' de manera descendente:"
            sort -r "$archivo"
            ;;
        3)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Ordenando las líneas del archivo '$archivo' numéricamente:"
            sort -n "$archivo"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Ordenando las líneas del archivo '$archivo' ignorando mayúsculas y minúsculas:"
            sort -f "$archivo"
            ;;
        5)
            echo -n "Ingrese el nombre del archivo de entrada: "
            read archivo
            echo -n "Ingrese el nombre del archivo de salida: "
            read salida
            echo "Ordenando las líneas del archivo '$archivo' y guardando los resultados en '$salida':"
            sort "$archivo" > "$salida"
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
