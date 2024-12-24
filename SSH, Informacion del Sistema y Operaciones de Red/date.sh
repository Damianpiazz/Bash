#!/bin/bash

menu() {
    echo "Menu de opciones para el comando date:"
    echo "1) Mostrar la fecha y hora actual"
    echo "2) Mostrar la fecha y hora en un formato personalizado"
    echo "3) Mostrar la fecha y hora en UTC"
    echo "4) Establecer una nueva fecha y hora (requiere sudo)"
    echo "5) Obtener el timestamp actual (Epoch)"
    echo "6) Convertir un timestamp a fecha legible"
    echo "7) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Fecha y hora actual:"
            date
            ;;
        2)
            echo "Seleccione el formato deseado:"
            echo "1) AAAA-MM-DD HH:MM:SS"
            echo "2) Solo fecha (AAAA-MM-DD)"
            echo "3) Solo hora (HH:MM:SS)"
            echo -n "Opcion: "
            read formato_opcion
            case $formato_opcion in
                1)
                    date +"%Y-%m-%d %H:%M:%S"
                    ;;
                2)
                    date +"%Y-%m-%d"
                    ;;
                3)
                    date +"%H:%M:%S"
                    ;;
                *)
                    echo "Formato no valido."
                    ;;
            esac
            ;;
        3)
            echo "Fecha y hora en UTC:"
            date -u
            ;;
        4)
            echo -n "Ingrese la nueva fecha y hora en el formato 'AAAA-MM-DD HH:MM:SS': "
            read nueva_fecha
            sudo date -s "$nueva_fecha"
            echo "Fecha y hora actualizada."
            ;;
        5)
            echo "Timestamp actual (Epoch):"
            date +"%s"
            ;;
        6)
            echo -n "Ingrese el timestamp a convertir: "
            read timestamp
            date -d @"$timestamp"
            ;;
        7)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opcion no valida. Intente nuevamente."
            ;;
    esac
    echo
done
