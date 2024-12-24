#!/bin/bash

menu() {
    echo "Menu de opciones para el comando ps:"
    echo "1) Mostrar todos los procesos del usuario actual"
    echo "2) Mostrar todos los procesos del sistema"
    echo "3) Mostrar procesos con detalles adicionales"
    echo "4) Mostrar procesos con un formato personalizado"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando todos los procesos del usuario actual:"
            ps
            ;;
        2)
            echo "Mostrando todos los procesos del sistema:"
            ps -e
            ;;
        3)
            echo "Mostrando procesos con detalles adicionales:"
            ps aux
            ;;
        4)
            echo "Mostrando procesos con un formato personalizado (PID, usuario, CPU, memoria, comando):"
            ps -eo pid,user,%cpu,%mem,command
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
