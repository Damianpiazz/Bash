#!/bin/bash

menu() {
    echo "Seleccione una opcion:"
    echo "1) Matar un proceso por nombre (SIGTERM, sin modificador)"
    echo "2) Forzar la terminacion de un proceso por nombre (SIGKILL, -9)"
    echo "3) Listar procesos por nombre antes de matarlos"
    echo "4) Enviar una señal personalizada (SIGHUP, -1) por nombre"
    echo "5) Matar multiples procesos especificando nombres separados por espacio"
    echo "6) Salir"
    echo -n "Opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del proceso que desea matar: "
            read nombre
            killall "$nombre"
            echo "Se intento detener todos los procesos llamados '$nombre' con SIGTERM."
            ;;
        2)
            echo -n "Ingrese el nombre del proceso que desea forzar a terminar: "
            read nombre
            killall -9 "$nombre"
            echo "Se forzo la terminacion de todos los procesos llamados '$nombre' con SIGKILL."
            ;;
        3)
            echo -n "Ingrese el nombre del proceso que desea listar: "
            read nombre
            pgrep -l "$nombre"
            echo -n "Desea matar todos los procesos listados? (s/n): "
            read confirmacion
            if [[ "$confirmacion" == "s" ]]; then
                killall "$nombre"
                echo "Se intentaron detener todos los procesos llamados '$nombre' con SIGTERM."
            else
                echo "No se realizo ninguna accion."
            fi
            ;;
        4)
            echo -n "Ingrese el nombre del proceso al que desea enviar SIGHUP: "
            read nombre
            killall -1 "$nombre"
            echo "Se envio la señal SIGHUP a todos los procesos llamados '$nombre'."
            ;;
        5)
            echo -n "Ingrese los nombres de los procesos a detener (separados por espacio): "
            read nombres
            killall $nombres
            echo "Se intentaron detener los procesos: $nombres con SIGTERM."
            ;;
        6)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opcion invalida. Intente nuevamente."
            ;;
    esac
    echo
done
