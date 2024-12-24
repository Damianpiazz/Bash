#!/bin/bash

menu() {
    echo "Menu de opciones para el comando dig:"
    echo "1) Consultar la dirección IP de un dominio"
    echo "2) Consultar los registros A (dirección IPv4) de un dominio"
    echo "3) Consultar los registros AAAA (dirección IPv6) de un dominio"
    echo "4) Consultar los registros MX (servidores de correo) de un dominio"
    echo "5) Consultar los registros NS (servidores de nombres) de un dominio"
    echo "6) Consultar los registros TXT de un dominio"
    echo "7) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el dominio para obtener su dirección IP: "
            read dominio
            echo "Consultando dirección IP de '$dominio'..."
            dig +short $dominio
            ;;
        2)
            echo -n "Ingrese el dominio para obtener los registros A (IPv4): "
            read dominio
            echo "Consultando registros A (IPv4) de '$dominio'..."
            dig $dominio A
            ;;
        3)
            echo -n "Ingrese el dominio para obtener los registros AAAA (IPv6): "
            read dominio
            echo "Consultando registros AAAA (IPv6) de '$dominio'..."
            dig $dominio AAAA
            ;;
        4)
            echo -n "Ingrese el dominio para obtener los registros MX (servidores de correo): "
            read dominio
            echo "Consultando registros MX (servidores de correo) de '$dominio'..."
            dig $dominio MX
            ;;
        5)
            echo -n "Ingrese el dominio para obtener los registros NS (servidores de nombres): "
            read dominio
            echo "Consultando registros NS (servidores de nombres) de '$dominio'..."
            dig $dominio NS
            ;;
        6)
            echo -n "Ingrese el dominio para obtener los registros TXT: "
            read dominio
            echo "Consultando registros TXT de '$dominio'..."
            dig $dominio TXT
            ;;
        7)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opción no válida. Intente nuevamente."
            ;;
    esac
    echo
done
