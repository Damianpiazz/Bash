#!/bin/bash

menu() {
    echo "Menu de opciones para el comando mkdir:"
    echo "1) Crear un directorio"
    echo "2) Crear varios directorios"
    echo "3) Crear un directorio y establecer permisos"
    echo "4) Crear directorios padres si no existen (opción -p)"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del directorio que desea crear: "
            read directorio
            if [ ! -d "$directorio" ]; then
                mkdir "$directorio"
                echo "Directorio '$directorio' creado."
            else
                echo "El directorio '$directorio' ya existe."
            fi
            ;;
        2)
            echo -n "Ingrese los nombres de los directorios que desea crear (separados por espacios): "
            read -a directorios
            for dir in "${directarios[@]}"; do
                if [ ! -d "$dir" ]; then
                    mkdir "$dir"
                    echo "Directorio '$dir' creado."
                else
                    echo "El directorio '$dir' ya existe."
                fi
            done
            ;;
        3)
            echo -n "Ingrese el nombre del directorio: "
            read directorio
            echo -n "Ingrese los permisos (por ejemplo, 755): "
            read permisos
            if [ ! -d "$directorio" ]; then
                mkdir "$directorio"
                chmod "$permisos" "$directorio"
                echo "Directorio '$directorio' creado con permisos '$permisos'."
            else
                echo "El directorio '$directorio' ya existe."
            fi
            ;;
        4)
            echo -n "Ingrese la ruta del directorio (con -p si es necesario crear directorios padres): "
            read ruta
            mkdir -p "$ruta"
            echo "Directorios '$ruta' creados (si no existían)."
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
