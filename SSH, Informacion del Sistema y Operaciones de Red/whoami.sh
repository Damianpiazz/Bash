#!/bin/bash

menu() {
    echo "Menu de opciones para el comando whoami:"
    echo "1) Mostrar el nombre del usuario actual"
    echo "2) Mostrar el ID de usuario (UID)"
    echo "3) Mostrar el ID de grupo (GID)"
    echo "4) Mostrar el nombre completo del usuario"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "El nombre del usuario actual es:"
            whoami
            ;;
        2)
            echo "El ID de usuario (UID) es:"
            id -u
            ;;
        3)
            echo "El ID de grupo (GID) es:"
            id -g
            ;;
        4)
            echo "El nombre completo del usuario es:"
            getent passwd $(whoami) | cut -d: -f5
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
