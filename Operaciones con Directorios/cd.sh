#!/bin/bash

menu() {
    echo "Menu de opciones para el comando cd:"
    echo "1) Cambiar al directorio raíz (/)"
    echo "2) Cambiar al directorio home del usuario (~)"
    echo "3) Cambiar al directorio anterior (-)"
    echo "4) Cambiar a un directorio específico"
    echo "5) Mostrar el directorio actual (pwd)"
    echo "6) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Cambiando al directorio raíz (/):"
            cd /
            ;;
        2)
            echo "Cambiando al directorio home del usuario (~):"
            cd ~
            ;;
        3)
            echo "Cambiando al directorio anterior (-):"
            cd -
            ;;
        4)
            echo -n "Ingrese la ruta del directorio al que desea cambiar: "
            read directorio
            if [ -d "$directorio" ]; then
                echo "Cambiando al directorio '$directorio':"
                cd "$directorio"
            else
                echo "El directorio '$directorio' no existe."
            fi
            ;;
        5)
            echo "Mostrando el directorio actual:"
            pwd
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
