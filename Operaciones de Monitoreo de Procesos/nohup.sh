#!/bin/bash

menu() {
    echo "Seleccione una opcion:"
    echo "1) Ejecutar un comando en segundo plano con nohup (salida a nohup.out)"
    echo "2) Especificar un archivo de salida personalizado"
    echo "3) Ejecutar un script con nohup"
    echo "4) Monitorear la salida de un proceso en tiempo real con tail"
    echo "5) Ejecutar un comando largo con nohup"
    echo "6) Ver procesos en segundo plano relacionados con nohup"
    echo "7) Detener un proceso ejecutado con nohup"
    echo "8) Salir"
    echo -n "Opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo "Ejecutando 'sleep 60' en segundo plano con nohup..."
            nohup sleep 60 &
            echo "El comando 'sleep 60' se esta ejecutando en segundo plano. Salida en nohup.out."
            ;;
        2)
            echo -n "Ingrese el archivo de salida personalizado: "
            read archivo
            echo "Ejecutando 'sleep 60' con salida redirigida a $archivo..."
            nohup sleep 60 > "$archivo" 2>&1 &
            echo "El comando 'sleep 60' se esta ejecutando en segundo plano. Salida en $archivo."
            ;;
        3)
            echo -n "Ingrese el nombre del script a ejecutar: "
            read script
            if [[ -f $script ]]; then
                echo "Ejecutando $script con nohup..."
                nohup ./"$script" &
                echo "El script $script se esta ejecutando en segundo plano. Salida en nohup.out."
            else
                echo "El script $script no existe."
            fi
            ;;
        4)
            echo -n "Ingrese el archivo de salida a monitorear: "
            read archivo
            if [[ -f $archivo ]]; then
                echo "Mostrando contenido de $archivo en tiempo real:"
                tail -f "$archivo"
            else
                echo "El archivo $archivo no existe."
            fi
            ;;
        5)
            echo "Ejecutando un comando largo (busqueda de archivos *.log en el sistema)..."
            nohup find / -name "*.log" > resultados.log 2>&1 &
            echo "El comando se esta ejecutando en segundo plano. Salida en resultados.log."
            ;;
        6)
            echo "Procesos relacionados con nohup:"
            ps -ef | grep nohup | grep -v grep
            ;;
        7)
            echo -n "Ingrese el nombre del proceso que desea detener (por ejemplo, sleep): "
            read proceso
            pids=$(pgrep -f "$proceso")
            if [[ -n $pids ]]; then
                echo "Deteniendo procesos: $pids"
                kill -9 $pids
                echo "Procesos relacionados con '$proceso' detenidos."
            else
                echo "No se encontraron procesos relacionados con '$proceso'."
            fi
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
