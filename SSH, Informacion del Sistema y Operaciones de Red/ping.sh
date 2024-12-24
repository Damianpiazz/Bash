#!/bin/bash

menu() {
    echo "Menu de opciones para el comando ping:"
    echo "1) Hacer un ping a un host o dominio"
    echo "2) Hacer un ping continuo a un host o dominio"
    echo "3) Hacer un ping con un número limitado de paquetes"
    echo "4) Hacer un ping con un tamaño de paquete especificado"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el host o dominio para hacer el ping: "
            read host
            echo "Haciendo ping a '$host'..."
            ping -c 4 $host
            ;;
        2)
            echo -n "Ingrese el host o dominio para hacer el ping continuo: "
            read host
            echo "Haciendo ping continuo a '$host' (Ctrl+C para detener)..."
            ping $host
            ;;
        3)
            echo -n "Ingrese el host o dominio para hacer el ping con un número limitado de paquetes: "
            read host
            echo -n "Ingrese el número de paquetes que desea enviar: "
            read paquetes
            echo "Haciendo ping a '$host' con $paquetes paquetes..."
            ping -c $paquetes $host
            ;;
        4)
            echo -n "Ingrese el host o dominio para hacer el ping con un tamaño de paquete especificado: "
            read host
            echo -n "Ingrese el tamaño del paquete en bytes: "
            read tamaño
            echo "Haciendo ping a '$host' con tamaño de paquete de $tamaño bytes..."
            ping -s $tamaño $host
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
