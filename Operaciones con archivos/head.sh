#!/bin/bash

menu() {
    echo "Menu de opciones para el comando head:"
    echo "1) Mostrar las primeras 10 lineas de un archivo"
    echo "2) Mostrar un numero personalizado de lineas de un archivo"
    echo "3) Mostrar las primeras 10 lineas de varios archivos"
    echo "4) Mostrar las primeras lineas de un archivo con un encabezado"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el archivo para mostrar las primeras 10 lineas: "
            read archivo
            echo "Mostrando las primeras 10 lineas del archivo '$archivo':"
            head "$archivo"
            ;;
        2)
            echo -n "Ingrese el archivo para mostrar las primeras lineas: "
            read archivo
            echo -n "Ingrese el numero de lineas a mostrar: "
            read lineas
            echo "Mostrando las primeras $lineas lineas del archivo '$archivo':"
            head -n "$lineas" "$archivo"
            ;;
        3)
            echo -n "Ingrese los archivos para mostrar las primeras 10 lineas (separados por espacio): "
            read archivos
            echo "Mostrando las primeras 10 lineas de los archivos '$archivos':"
            head $archivos
            ;;
        4)
            echo -n "Ingrese el archivo para mostrar las primeras lineas con encabezado: "
            read archivo
            echo -n "Ingrese un encabezado para cada archivo: "
            read encabezado
            echo "Mostrando las primeras 10 lineas del archivo '$archivo' con encabezado '$encabezado':"
            head -n 10 "$archivo" | sed "1s/^/$encabezado\n/"
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
