#!/bin/bash

menu() {
    echo "Menu de gestion de procesos en segundo plano:"
    echo "1) Ejecutar un comando en segundo plano"
    echo "2) Listar procesos en segundo plano"
    echo "3) Reanudar un proceso detenido (bg)"
    echo "4) Traer un proceso en segundo plano al primer plano (fg)"
    echo "5) Detener un proceso (kill)"
    echo "6) Salir"
    echo -n "Opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el comando a ejecutar en segundo plano: "
            read comando
            echo "Ejecutando '$comando' en segundo plano..."
            $comando &
            echo "Comando ejecutado en segundo plano."
            ;;
        2)
            echo "Procesos en segundo plano:"
            jobs
            ;;
        3)
            echo -n "Ingrese el numero del trabajo a reanudar (ejemplo: %1): "
            read trabajo
            echo "Reanudando el trabajo $trabajo..."
            bg "$trabajo"
            ;;
        4)
            echo -n "Ingrese el numero del trabajo a traer al primer plano (ejemplo: %1): "
            read trabajo
            echo "Trayendo el trabajo $trabajo al primer plano..."
            fg "$trabajo"
            ;;
        5)
            echo -n "Ingrese el nombre o PID del proceso a detener: "
            read proceso
            pids=$(pgrep -f "$proceso")
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
                echo "No se encontraron procesos relacionados con '$proceso'."
            fi
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
