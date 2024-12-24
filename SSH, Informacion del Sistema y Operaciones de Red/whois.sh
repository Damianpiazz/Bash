#!/bin/bash

menu() {
    echo "Menu de opciones para el comando whois:"
    echo "1) Obtener información sobre un dominio"
    echo "2) Obtener información sobre una dirección IP"
    echo "3) Obtener información sobre un dominio y mostrar el resultado con más detalle"
    echo "4) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del dominio: "
            read dominio
            echo "Obteniendo información sobre el dominio '$dominio':"
            whois $dominio
            ;;
        2)
            echo -n "Ingrese la dirección IP: "
            read ip
            echo "Obteniendo información sobre la dirección IP '$ip':"
            whois $ip
            ;;
        3)
            echo -n "Ingrese el nombre del dominio: "
            read dominio
            echo "Obteniendo información detallada sobre el dominio '$dominio':"
            whois $dominio | more
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
