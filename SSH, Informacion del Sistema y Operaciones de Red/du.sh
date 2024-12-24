#!/bin/bash

menu() {
    echo "Menu de opciones para el comando du:"
    echo "1) Mostrar el uso de espacio en disco del directorio actual"
    echo "2) Mostrar el uso de espacio en disco de un directorio específico"
    echo "3) Mostrar el uso de espacio en disco de un directorio con formato legible"
    echo "4) Mostrar el uso de espacio en disco de un directorio incluyendo subdirectorios"
    echo "5) Mostrar el uso de espacio de archivos y directorios con la opción de resumen"
    echo "6) Mostrar el uso de espacio de directorios con un límite de profundidad"
    echo "7) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Uso de espacio en disco del directorio actual:"
            du .
            ;;
        2)
            echo -n "Ingrese el directorio para obtener el uso de espacio: "
            read directorio
            echo "Uso de espacio en disco de '$directorio':"
            du $directorio
            ;;
        3)
            echo -n "Ingrese el directorio para obtener el uso de espacio en formato legible: "
            read directorio
            echo "Uso de espacio en disco de '$directorio' en formato legible:"
            du -h $directorio
            ;;
        4)
            echo -n "Ingrese el directorio para obtener el uso de espacio incluyendo subdirectorios: "
            read directorio
            echo "Uso de espacio en disco de '$directorio' incluyendo subdirectorios:"
            du -a $directorio
            ;;
        5)
            echo -n "Ingrese el directorio para obtener el resumen del uso de espacio: "
            read directorio
            echo "Resumen del uso de espacio de '$directorio':"
            du -sh $directorio
            ;;
        6)
            echo -n "Ingrese el directorio para obtener el uso de espacio con un límite de profundidad: "
            read directorio
            echo -n "Ingrese el nivel de profundidad (por ejemplo, 2): "
            read profundidad
            echo "Uso de espacio de '$directorio' con un límite de profundidad de $profundidad:"
            du -h --max-depth=$profundidad $directorio
            ;;
        7)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
