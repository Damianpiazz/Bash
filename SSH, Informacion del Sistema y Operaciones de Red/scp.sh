#!/bin/bash

menu() {
    echo "Menu de opciones para el comando scp:"
    echo "1) Copiar un archivo local a un servidor remoto"
    echo "2) Copiar un archivo remoto a la máquina local"
    echo "3) Copiar un archivo entre dos servidores remotos"
    echo "4) Copiar un directorio completo de manera recursiva"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese la ruta del archivo local a copiar: "
            read archivo_local
            echo -n "Ingrese la dirección del servidor remoto (usuario@host:/ruta): "
            read servidor_remoto
            echo "Copiando '$archivo_local' a '$servidor_remoto'..."
            scp $archivo_local $servidor_remoto
            ;;
        2)
            echo -n "Ingrese la dirección del servidor remoto (usuario@host:/ruta): "
            read servidor_remoto
            echo -n "Ingrese la ruta de destino local para el archivo: "
            read archivo_local
            echo "Copiando de '$servidor_remoto' a '$archivo_local'..."
            scp $servidor_remoto $archivo_local
            ;;
        3)
            echo -n "Ingrese la dirección del servidor remoto origen (usuario@host:/ruta): "
            read servidor_origen
            echo -n "Ingrese la dirección del servidor remoto destino (usuario@host:/ruta): "
            read servidor_destino
            echo "Copiando archivo de '$servidor_origen' a '$servidor_destino'..."
            scp $servidor_origen $servidor_destino
            ;;
        4)
            echo -n "Ingrese la ruta del directorio local a copiar: "
            read directorio_local
            echo -n "Ingrese la dirección del servidor remoto (usuario@host:/ruta): "
            read servidor_remoto
            echo "Copiando el directorio '$directorio_local' a '$servidor_remoto'..."
            scp -r $directorio_local $servidor_remoto
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
