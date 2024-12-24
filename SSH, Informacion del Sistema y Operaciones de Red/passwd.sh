#!/bin/bash

menu() {
    echo "Menu de opciones para el comando passwd:"
    echo "1) Cambiar la contraseña de un usuario"
    echo "2) Cambiar la contraseña del usuario actual"
    echo "3) Deshabilitar la contraseña de un usuario (bloquear cuenta)"
    echo "4) Habilitar la cuenta de un usuario"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre de usuario para cambiar su contraseña: "
            read usuario
            echo "Cambiar la contraseña de '$usuario'."
            sudo passwd $usuario
            ;;
        2)
            echo "Cambiar la contraseña del usuario actual."
            sudo passwd
            ;;
        3)
            echo -n "Ingrese el nombre de usuario para bloquear su cuenta: "
            read usuario
            echo "Deshabilitando la cuenta de '$usuario'."
            sudo passwd -l $usuario
            ;;
        4)
            echo -n "Ingrese el nombre de usuario para habilitar su cuenta: "
            read usuario
            echo "Habilitando la cuenta de '$usuario'."
            sudo passwd -u $usuario
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
