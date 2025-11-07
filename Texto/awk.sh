#!/bin/bash

# Función que muestra el menú de opciones disponibles
menu() {
    echo "Menu de opciones para el comando awk:"
    echo "1) Imprimir el contenido de una columna especifica"
    echo "2) Imprimir las lineas que cumplen con un patron"
    echo "3) Realizar una operacion aritmetica con columnas"
    echo "4) Imprimir una linea completa con un patron especifico"
    echo "5) Salir"
    echo -n "Seleccione una opcion: "
}

# Bucle principal del menú
while true; do
    menu  # Mostrar el menú
    read opcion  # Leer la opción seleccionada por el usuario

    case $opcion in
        1)
            # Opción 1: Imprimir una columna específica
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el numero de la columna: "
            read columna
            echo "Imprimiendo el contenido de la columna $columna:"
            awk "{print \$$columna}" "$archivo"
            ;;
        2)
            # Opción 2: Mostrar líneas que cumplan con un patrón
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patron de busqueda: "
            read patron
            echo "Imprimiendo las lineas que coinciden con el patron '$patron':"
            awk "/$patron/" "$archivo"
            ;;
        3)
            # Opción 3: Realizar operación aritmética con columnas
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese la operacion aritmetica con las columnas (por ejemplo, \$1+\$2): "
            read operacion
            echo "Realizando la operacion aritmetica '$operacion' en el archivo:"
            awk "{print $operacion}" "$archivo"
            ;;
        4)
            # Opción 4: Imprimir línea completa que coincida con patrón
            echo -n "Ingrese el nombre del archivo: "
            read archivo
            echo -n "Ingrese el patron de busqueda para la linea completa: "
            read patron
            echo "Imprimiendo las lineas completas que coinciden con el patron '$patron':"
            awk "\$0 ~ /$patron/" "$archivo"
            ;;
        5)
            # Opción 5: Salir del programa
            echo "Saliendo del programa."
            exit 0
            ;;
        *)
            # Opción inválida
            echo "Opcion no valida. Intente nuevamente."
            ;;
    esac
    echo  # Salto de línea para claridad en el menú
done