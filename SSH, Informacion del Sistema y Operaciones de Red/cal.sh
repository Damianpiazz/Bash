#!/bin/bash

menu() {
    echo "Menu de opciones para el comando cal:"
    echo "1) Mostrar el calendario del mes actual"
    echo "2) Mostrar el calendario de un mes específico"
    echo "3) Mostrar el calendario de un año específico"
    echo "4) Mostrar el calendario de un rango de meses"
    echo "5) Mostrar el calendario de un año con detalles"
    echo "6) Mostrar el calendario con el día de la semana comenzando en domingo"
    echo "7) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Calendario del mes actual:"
            cal
            ;;
        2)
            echo -n "Ingrese el mes (1-12): "
            read mes
            echo -n "Ingrese el año (por ejemplo, 2024): "
            read anio
            echo "Calendario de $mes/$anio:"
            cal $mes $anio
            ;;
        3)
            echo -n "Ingrese el año (por ejemplo, 2024): "
            read anio
            echo "Calendario del año $anio:"
            cal -y $anio
            ;;
        4)
            echo -n "Ingrese el mes de inicio (1-12): "
            read mes_inicio
            echo -n "Ingrese el mes de fin (1-12): "
            read mes_fin
            echo -n "Ingrese el año (por ejemplo, 2024): "
            read anio
            echo "Calendario de los meses $mes_inicio a $mes_fin de $anio:"
            for mes in $(seq $mes_inicio $mes_fin); do
                cal $mes $anio
            done
            ;;
        5)
            echo -n "Ingrese el año (por ejemplo, 2024): "
            read anio
            echo "Calendario completo del año $anio:"
            cal -y $anio
            ;;
        6)
            echo "Calendario del mes actual con el domingo como primer día de la semana:"
            cal -s
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
