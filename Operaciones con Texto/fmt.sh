#!/bin/bash

menu() {
    echo "Menu de opciones para el comando fmt:"
    echo "1) Formatear un archivo con un ancho de línea específico"
    echo "2) Formatear un texto ingresado por el usuario"
    echo "3) Formatear un archivo y sobrescribirlo"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el ancho máximo de las líneas: "
            read ancho
            echo "Formateando el archivo '$archivo' con un ancho de línea de $ancho caracteres:"
            fmt -w "$ancho" "$archivo"
            ;;
        2)
            echo -n "Ingrese el texto que desea formatear: "
            read texto
            echo -n "Ingrese el ancho máximo de las líneas: "
            read ancho
            echo "Formateando el texto con un ancho de línea de $ancho caracteres:"
            echo "$texto" | fmt -w "$ancho"
            ;;
        3)
            echo -n "Ingrese el nombre del archivo a formatear: "
            read archivo
            echo -n "Ingrese el ancho máximo de las líneas: "
            read ancho
            echo "Formateando el archivo '$archivo' con un ancho de línea de $ancho caracteres y sobrescribiéndolo:"
            fmt -w "$ancho" "$archivo" > "$archivo"
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
