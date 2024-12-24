#!/bin/bash

menu() {
    echo "Menu de opciones para el comando quota:"
    echo "1) Mostrar el uso de cuota del usuario actual"
    echo "2) Mostrar el uso de cuota de un usuario específico"
    echo "3) Mostrar el uso de cuota en todos los sistemas de archivos"
    echo "4) Ver los límites de cuota de un usuario específico"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando el uso de cuota del usuario actual:"
            quota
            ;;
        2)
            echo -n "Ingrese el nombre de usuario para mostrar su uso de cuota: "
            read usuario
            echo "Mostrando el uso de cuota de '$usuario':"
            quota $usuario
            ;;
        3)
            echo "Mostrando el uso de cuota en todos los sistemas de archivos:"
            quota -v
            ;;
        4)
            echo -n "Ingrese el nombre de usuario para ver sus límites de cuota: "
            read usuario
            echo "Mostrando los límites de cuota de '$usuario':"
            repquota -a | grep $usuario
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
