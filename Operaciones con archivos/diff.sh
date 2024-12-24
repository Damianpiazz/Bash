#!/bin/bash

menu() {
    echo "Menu de opciones para el comando diff:"
    echo "1) Comparar dos archivos"
    echo "2) Comparar dos directorios"
    echo "3) Mostrar las diferencias con salida unificada"
    echo "4) Mostrar las diferencias en formato de lado a lado"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el primer archivo: "
            read archivo1
            echo -n "Ingrese el segundo archivo: "
            read archivo2
            echo "Comparando los archivos '$archivo1' y '$archivo2':"
            diff "$archivo1" "$archivo2"
            ;;
        2)
            echo -n "Ingrese el primer directorio: "
            read directorio1
            echo -n "Ingrese el segundo directorio: "
            read directorio2
            echo "Comparando los directorios '$directorio1' y '$directorio2':"
            diff -r "$directorio1" "$directorio2"
            ;;
        3)
            echo -n "Ingrese el primer archivo: "
            read archivo1
            echo -n "Ingrese el segundo archivo: "
            read archivo2
            echo "Mostrando las diferencias en formato unificado entre '$archivo1' y '$archivo2':"
            diff -u "$archivo1" "$archivo2"
            ;;
        4)
            echo -n "Ingrese el primer archivo: "
            read archivo1
            echo -n "Ingrese el segundo archivo: "
            read archivo2
            echo "Mostrando las diferencias en formato de lado a lado entre '$archivo1' y '$archivo2':"
            diff -y "$archivo1" "$archivo2"
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
