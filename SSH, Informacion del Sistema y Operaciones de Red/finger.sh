#!/bin/bash

menu() {
    echo "Menu de opciones para el comando finger:"
    echo "1) Mostrar información de un usuario específico"
    echo "2) Mostrar información de todos los usuarios"
    echo "3) Mostrar información de un usuario con detalles completos"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre de usuario para mostrar su informacion: "
            read usuario
            echo "Información de usuario '$usuario':"
            finger $usuario
            ;;
        2)
            echo "Información de todos los usuarios del sistema:"
            finger
            ;;
        3)
            echo -n "Ingrese el nombre de usuario para mostrar su información completa: "
            read usuario
            echo "Información completa de '$usuario':"
            finger -l $usuario
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
