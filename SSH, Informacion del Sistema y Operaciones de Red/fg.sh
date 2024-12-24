#!/bin/bash

menu() {
    echo "Menu de opciones para el comando fg:"
    echo "1) Mostrar los trabajos en segundo plano"
    echo "2) Traer un trabajo en segundo plano al primer plano"
    echo "3) Traer un trabajo específico al primer plano"
    echo "4) Traer el último trabajo detenido al primer plano"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Mostrando los trabajos en segundo plano:"
            jobs
            ;;
        2)
            echo -n "Ingrese el número del trabajo que desea traer al primer plano (por ejemplo, %1): "
            read trabajo
            echo "Trayendo el trabajo '$trabajo' al primer plano..."
            fg $trabajo
            ;;
        3)
            echo -n "Ingrese el número del trabajo específico que desea traer al primer plano (por ejemplo, %2): "
            read trabajo
            echo "Trayendo el trabajo '$trabajo' al primer plano..."
            fg $trabajo
            ;;
        4)
            echo "Trayendo el último trabajo detenido al primer plano..."
            fg
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
