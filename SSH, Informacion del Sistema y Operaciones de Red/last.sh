#!/bin/bash

menu() {
    echo "Menu de opciones para el comando last:"
    echo "1) Mostrar el historial de inicios de sesión de todos los usuarios"
    echo "2) Mostrar el historial de inicios de sesión de un usuario específico"
    echo "3) Mostrar el historial de inicios de sesión con un límite de líneas"
    echo "4) Mostrar el historial de inicios de sesión de la última sesión"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Historial de inicios de sesión de todos los usuarios:"
            last
            ;;
        2)
            echo -n "Ingrese el nombre de usuario para mostrar su historial de inicios de sesión: "
            read usuario
            echo "Historial de inicios de sesión de '$usuario':"
            last $usuario
            ;;
        3)
            echo -n "Ingrese el número de líneas para limitar el historial mostrado: "
            read lineas
            echo "Historial de inicios de sesión (limitado a $lineas líneas):"
            last -n $lineas
            ;;
        4)
            echo "Historial de inicios de sesión de la última sesión:"
            last -1
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
