#!/bin/bash

menu() {
    echo "Menu de opciones para el comando find:"
    echo "1) Buscar archivos por nombre"
    echo "2) Buscar archivos por tipo"
    echo "3) Buscar archivos por tamaño"
    echo "4) Buscar archivos modificados recientemente"
    echo "5) Buscar archivos con permisos específicos"
    echo "6) Buscar y ejecutar un comando en los archivos encontrados"
    echo "7) Salir"
    echo -n "Seleccione una opcion: "
}

while true; do
    menu
    read opcion

    case $opcion in
        1)
            echo -n "Ingrese el directorio donde buscar: "
            read directorio
            echo -n "Ingrese el nombre del archivo (o patrón): "
            read patron
            echo "Buscando archivos con el nombre '$patron' en el directorio '$directorio':"
            find "$directorio" -name "$patron"
            ;;
        2)
            echo -n "Ingrese el directorio donde buscar: "
            read directorio
            echo -n "Ingrese el tipo de archivo (por ejemplo, f para archivos regulares, d para directorios): "
            read tipo
            echo "Buscando archivos de tipo '$tipo' en el directorio '$directorio':"
            find "$directorio" -type "$tipo"
            ;;
        3)
            echo -n "Ingrese el directorio donde buscar: "
            read directorio
            echo -n "Ingrese el tamaño mínimo de archivo en bytes (por ejemplo, 100k para 100 kilobytes): "
            read tamanio
            echo "Buscando archivos con un tamaño mayor a '$tamanio' en el directorio '$directorio':"
            find "$directorio" -size +"$tamanio"
            ;;
        4)
            echo -n "Ingrese el directorio donde buscar: "
            read directorio
            echo -n "Ingrese el número de días para buscar archivos modificados recientemente: "
            read dias
            echo "Buscando archivos modificados en los últimos $dias días en el directorio '$directorio':"
            find "$directorio" -mtime -"$dias"
            ;;
        5)
            echo -n "Ingrese el directorio donde buscar: "
            read directorio
            echo -n "Ingrese los permisos en formato octal (por ejemplo, 755): "
            read permisos
            echo "Buscando archivos con permisos '$permisos' en el directorio '$directorio':"
            find "$directorio" -perm "$permisos"
            ;;
        6)
            echo -n "Ingrese el directorio donde buscar: "
            read directorio
            echo -n "Ingrese el comando a ejecutar sobre los archivos encontrados: "
            read comando
            echo "Buscando archivos en '$directorio' y ejecutando el comando '$comando' sobre ellos:"
            find "$directorio" -exec $comando {} \;
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
