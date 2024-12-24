#!/bin/bash

menu() {
    echo "Seleccione una opcion:"
    echo "1) Matar un proceso (SIGTERM, sin modificador)"
    echo "2) Forzar la terminacion de un proceso (SIGKILL, -9)"
    echo "3) Listar procesos y matar uno por nombre"
    echo "4) Enviar una señal personalizada (SIGHUP, -1)"
    echo "5) Matar multiples procesos a la vez"
    echo "6) Salir"
    echo -n "Opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el PID del proceso que desea matar: "
            read pid
            kill $pid
            echo "Se intento detener el proceso $pid con SIGTERM."
            ;;
        2)
            echo -n "Ingrese el PID del proceso que desea forzar a terminar: "
            read pid
            kill -9 $pid
            echo "Se forzo la terminacion del proceso $pid con SIGKILL."
            ;;
        3)
            echo -n "Ingrese el nombre del proceso que desea buscar: "
            read nombre_proceso
            ps aux | grep "$nombre_proceso" | grep -v "grep"
            echo -n "Ingrese el PID del proceso que desea matar: "
            read pid
            kill $pid
            echo "Se intento detener el proceso $pid con SIGTERM."
            ;;
        4)
            echo -n "Ingrese el PID del proceso al que desea enviar SIGHUP: "
            read pid
            kill -1 $pid
            echo "Se envio la señal SIGHUP al proceso $pid."
            ;;
        5)
            echo -n "Ingrese los PIDs de los procesos a detener (separados por espacio): "
            read pids
            kill $pids
            echo "Se intentaron detener los procesos: $pids con SIGTERM."
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
