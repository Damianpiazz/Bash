#!/bin/bash

menu() {
    echo "Menu de opciones para el comando echo:"
    echo "1) Imprimir un mensaje simple"
    echo "2) Imprimir texto con variables"
    echo "3) Imprimir texto con saltos de línea"
    echo "4) Imprimir texto con colores"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el mensaje que desea imprimir: "
            read mensaje
            echo "Mensaje: $mensaje"
            ;;
        2)
            echo -n "Ingrese el nombre de una variable: "
            read varname
            echo -n "Ingrese el valor para la variable '$varname': "
            read varvalue
            export "$varname"="$varvalue"
            echo "El valor de la variable $varname es: $varvalue"
            ;;
        3)
            echo -n "Ingrese el mensaje que desea imprimir (con saltos de línea): "
            read mensaje
            echo -e "$mensaje"
            ;;
        4)
            echo "Elija un color:"
            echo "1) Rojo"
            echo "2) Verde"
            echo "3) Azul"
            echo -n "Seleccione una opción: "
            read color

            case $color in
                1)
                    echo -e "\e[31mEste es un mensaje en rojo\e[0m"
                    ;;
                2)
                    echo -e "\e[32mEste es un mensaje en verde\e[0m"
                    ;;
                3)
                    echo -e "\e[34mEste es un mensaje en azul\e[0m"
                    ;;
                *)
                    echo "Opción no válida. Mostrando mensaje por defecto."
                    echo "Este es un mensaje sin color."
                    ;;
            esac
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
