#!/bin/bash

menu() {
    echo "Menu de opciones para el comando chown:"
    echo "1) Ver el propietario y grupo de un archivo"
    echo "2) Cambiar el propietario y grupo de un archivo"
    echo "3) Cambiar el propietario y grupo de un directorio y su contenido de manera recursiva"
    echo "4) Cambiar solo el propietario o solo el grupo de un archivo"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo "Mostrando el propietario y grupo del archivo '$archivo':"
            ls -l "$archivo" | awk '{print "Propietario: " $3 ", Grupo: " $4}'
            ;;
        2)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el nuevo propietario: "
            read propietario
            echo -n "Ingrese el nuevo grupo: "
            read grupo
            echo "Cambiando el propietario y grupo del archivo '$archivo' a '$propietario:$grupo':"
            chown "$propietario:$grupo" "$archivo"
            ;;
        3)
            echo -n "Ingrese el nombre del directorio: "
            read directorio
            echo -n "Ingrese el nuevo propietario: "
            read propietario
            echo -n "Ingrese el nuevo grupo: "
            read grupo
            echo "Cambiando el propietario y grupo del directorio '$directorio' y su contenido de manera recursiva a '$propietario:$grupo':"
            chown -R "$propietario:$grupo" "$directorio"
            ;;
        4)
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Desea cambiar el propietario (s/n)? "
            read cambiar_propietario
            if [[ "$cambiar_propietario" == "s" || "$cambiar_propietario" == "S" ]]; then
                echo -n "Ingrese el nuevo propietario: "
                read propietario
                chown "$propietario" "$archivo"
                echo "Propietario del archivo '$archivo' cambiado a '$propietario'."
            fi
            echo -n "Desea cambiar el grupo (s/n)? "
            read cambiar_grupo
            if [[ "$cambiar_grupo" == "s" || "$cambiar_grupo" == "S" ]]; then
                echo -n "Ingrese el nuevo grupo: "
                read grupo
                chown ":$grupo" "$archivo"
                echo "Grupo del archivo '$archivo' cambiado a '$grupo'."
            fi
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
