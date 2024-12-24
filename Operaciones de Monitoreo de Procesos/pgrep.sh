#!/bin/bash

menu() {
    echo "Seleccione una opcion:"
    echo "1) Buscar procesos por nombre"
    echo "2) Buscar procesos por nombre exacto"
    echo "3) Buscar procesos de un usuario especifico"
    echo "4) Buscar procesos en ejecucion por PID mayor a un valor dado"
    echo "5) Buscar procesos con una expresion regular"
    echo "6) Detener un proceso especifico encontrado con pgrep"
    echo "7) Mostrar el conteo de procesos coincidentes"
    echo "8) Salir"
    echo -n "Opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del proceso: "
            read nombre
            echo "Procesos que coinciden con '$nombre':"
            pgrep -l "$nombre"
            ;;
        2)
            echo -n "Ingrese el nombre exacto del proceso: "
            read nombre
            echo "Procesos que coinciden exactamente con '$nombre':"
            pgrep -lx "$nombre"
            ;;
        3)
            echo -n "Ingrese el nombre de usuario: "
            read usuario
            echo "Procesos del usuario '$usuario':"
            pgrep -lu "$usuario"
            ;;
        4)
            echo -n "Ingrese el valor minimo del PID: "
            read pid_min
            echo "Procesos con PID mayor a $pid_min:"
            pgrep -l -v "$pid_min"
            ;;
        5)
            echo -n "Ingrese una expresion regular: "
            read regex
            echo "Procesos que coinciden con la expresion regular '$regex':"
            pgrep -lf "$regex"
            ;;
        6)
            echo -n "Ingrese el nombre del proceso a detener: "
            read nombre
            pids=$(pgrep "$nombre")
            if [[ -n $pids ]]; then
                echo "Procesos encontrados: $pids"
                echo -n "Desea detenerlos? (s/n): "
                read confirmacion
                if [[ "$confirmacion" == "s" ]]; then
                    kill -9 $pids
                    echo "Procesos detenidos."
                else
                    echo "No se realizo ninguna accion."
                fi
            else
                echo "No se encontraron procesos con el nombre '$nombre'."
            fi
            ;;
        7)
            echo -n "Ingrese el nombre del proceso: "
            read nombre
            count=$(pgrep -c "$nombre")
            echo "Numero de procesos que coinciden con '$nombre': $count"
            ;;
        8)
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            echo "Opcion invalida. Intente nuevamente."
            ;;
    esac
    echo
done
