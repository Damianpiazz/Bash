#!/bin/bash
# Trabajo Practico Nº 3 - Scripts - Todo en un solo archivo
# Universidad Tecnologica Nacional - Facultad Regional La Plata - Catedra de Sistemas Operativos 2024

mkdir -p ~/documentos/practicas/tp3
cd ~/documentos/practicas/tp3 || exit

# ------------------ Punto 1 ------------------
# Guardar las variables de entorno HOSTNAME, HOME, LOGNAME y PATH en un archivo var-set ordenado por nombre
echo "---------------- Punto 1 ----------------"
env | grep -E 'HOSTNAME|HOME|LOGNAME|PATH' | sort > var-set
echo "Variables guardadas en var-set"

# ------------------ Punto 2 ------------------
# Cambiar permisos de todos los scripts de la practica 2 para que puedan ser ejecutados por otros y modificados por el grupo
echo "---------------- Punto 2 ----------------"
TP2_DIR=~/documentos/practicas/tp2
if [ -d "$TP2_DIR" ]; then
    for f in "$TP2_DIR"/*; do
        chmod g+w,o+x "$f"
    done
    echo "Permisos de practica 2 actualizados"
else
    echo "Directorio tp2 no encontrado"
fi

# ------------------ Punto 3 ------------------
# Recorrer el directorio tp1 y encontrar archivos ordinarios con permiso 644; guardar solo nombres en "perm644"
echo "---------------- Punto 3 ----------------"
TP1_DIR=~/practicas/tp1
if [ -d "$TP1_DIR" ]; then
    find "$TP1_DIR" -type f -perm 644 -exec basename {} \; > perm644
    echo "Archivo perm644 creado con nombres de archivos con permiso 644"
else
    echo "Directorio tp1 no encontrado"
fi

# ------------------ Punto 4 ------------------
# Usando find, generar archivos con nombres que comiencen con "a", extensión .txt, permisos 644 y tamaño >1K
echo "---------------- Punto 4 ----------------"
dir="$1"
if [ -z "$dir" ] || [ ! -d "$dir" ]; then
    echo "Punto 4: Se debe pasar un directorio como parametro"
else
    find "$dir" -type f -name "a*" -exec basename {} \; > name
    find "$dir" -type f -name "*.txt" -exec basename {} \; > extend
    find "$dir" -type f -perm 644 -exec basename {} \; > perm
    find "$dir" -type f -size +1k -exec basename {} \; > tam
    echo "Archivos name, extend, perm, tam generados en $dir"
fi

# ------------------ Punto 5 ------------------
# Recorrer directorio y determinar que archivos fueron modificados en un mes pasado como parametro
echo "---------------- Punto 5 ----------------"
mes="$2"
if [ -z "$dir" ] || [ ! -d "$dir" ] || [ -z "$mes" ]; then
    echo "Punto 5: Se requiere directorio y mes como parametro"
else
    for f in "$dir"/*; do
        if [ -f "$f" ]; then
            archivo_mes=$(stat -c %y "$f" | awk -v m="$mes" '{if ($2 ~ m) print $0}')
            [ ! -z "$archivo_mes" ] && echo "$f fue modificado en el mes $mes"
        fi
    done
fi

# ------------------ Punto 6 ------------------
# Hacer un informe de un directorio indicando archivos modificados/accedidos en distintos rangos de tiempo
echo "---------------- Punto 6 ----------------"
if [ -z "$dir" ] || [ ! -d "$dir" ]; then
    echo "Punto 6: Se requiere directorio como parametro"
else
    echo "Archivos modificados en últimos 30 minutos:"
    find "$dir" -type f -mmin -30
    echo "Archivos accedidos en últimos 60 minutos:"
    find "$dir" -type f -amin -60
    echo "Archivos modificados en últimos 5 dias:"
    find "$dir" -type f -mtime -5
    echo "Archivos modificados hace más de 10 dias:"
    find "$dir" -type f -mtime +10
fi

# ------------------ Punto 7 ------------------
# Pedir dos numeros al usuario y mostrar suma, resta, producto y division
echo "---------------- Punto 7 ----------------"
read -rp "Ingrese primer numero: " n1
read -rp "Ingrese segundo numero: " n2
echo "Suma: $((n1+n2))"
echo "Resta: $((n1-n2))"
echo "Producto: $((n1*n2))"
if [ "$n2" -ne 0 ]; then
    echo "Division: $((n1/n2))"
else
    echo "Division: Error, divisor es 0"
fi

# ------------------ Punto 8 ------------------
# Contabilizar cantidad de archivos y directorios en un directorio pasado como argumento
echo "---------------- Punto 8 ----------------"
if [ -d "$dir" ]; then
    archivos=0
    directorios=0
    for f in "$dir"/*; do
        if [ -f "$f" ]; then ((archivos++))
        elif [ -d "$f" ]; then ((directorios++))
        fi
    done
    echo "Archivos: $archivos" > contador.txt
    echo "Directorios: $directorios" >> contador.txt
    echo "Contadores guardados en contador.txt"
fi

# ------------------ Punto 9 ------------------
# Mostrar numeros naturales del 1 al 20
echo "---------------- Punto 9 ----------------"
for i in {1..20}; do echo "$i"; done

# ------------------ Punto 10 ------------------
# Menu con 4 opciones: borrar, visualizar, copiar archivo o salir
echo "---------------- Punto 10 ----------------"
while true; do
    echo "Menu: 1-Borrar fichero, 2-Visualizar fichero, 3-Copiar fichero, 4-Salir"
    read -rp "Opcion: " op
    case $op in
        1) read -rp "Nombre del fichero a borrar: " f; [ -f "$f" ] && rm "$f" && echo "Fichero borrado";;
        2) read -rp "Nombre del fichero a visualizar: " f; [ -f "$f" ] && cat "$f";;
        3) read -rp "Nombre del fichero a copiar: " f; [ -f "$f" ] && cp "$f" . && echo "Fichero copiado";;
        4) break;;
        *) echo "Opcion invalida";;
    esac
done

# ------------------ Punto 11 ------------------
# Pedir continuamente palabra clave y mostrar mensaje si es "secreto"
echo "---------------- Punto 11 ----------------"
while true; do
    read -rp "Ingrese palabra clave: " palabra
    if [ "$palabra" = "secreto" ]; then
        echo "Bienvenido"
        break
    fi
done

# ------------------ Punto 12 ------------------
# Comparar dos cadenas de caracteres pasadas como parametro
echo "---------------- Punto 12 ----------------"
if [ $# -ne 2 ]; then
    echo "Uso: $0 cadena1 cadena2"
else
    if [ "$1" = "$2" ]; then
        echo "Cadenas correctas"
    else
        echo "Cadenas incorrectas"
    fi
fi

# ------------------ Punto 13 ------------------
# Comparar el tamaño de dos directorios pasados por parametro
echo "---------------- Punto 13 ----------------"
dir1="$1"
dir2="$2"
if [ -d "$dir1" ] && [ -d "$dir2" ]; then
    tam1=$(du -s "$dir1" | awk '{print $1}')
    tam2=$(du -s "$dir2" | awk '{print $1}')
    if [ "$tam1" -gt "$tam2" ]; then
        echo "$dir1 tiene mayor tamaño"
    else
        echo "$dir2 tiene mayor tamaño"
    fi
fi

# ------------------ Punto 14 ------------------
# Eliminar una cadena de caracteres pasada como parametro de un archivo ordinario
echo "---------------- Punto 14 ----------------"
archivo="$1"
cadena="$2"
if [ -f "$archivo" ]; then
    sed "s/$cadena//g" "$archivo" > "${archivo}_nuevo"
    chmod 600 "${archivo}_nuevo"
    echo "Archivo procesado: ${archivo}_nuevo (solo lectura y escritura para el dueño)"
fi

# ------------------ Punto 15 ------------------
# Leer directorio tp2, reemplazar "bash" por "sh" en cada archivo, guardar en "scripts-sh"
echo "---------------- Punto 15 ----------------"
mkdir -p scripts-sh
for f in ~/documentos/practicas/tp2/*; do
    if [ -f "$f" ]; then
        sed 's/bash/sh/g' "$f" > scripts-sh/"$(basename "$f")"
    fi
done
echo "Scripts modificados guardados en scripts-sh"

# ------------------ Punto 16 ------------------
# Borrar un rango de líneas de un archivo ordinario
echo "---------------- Punto 16 ----------------"
archivo="$1"
ini="$2"
fin="$3"
if [ -f "$archivo" ]; then
    sed "${ini},${fin}d" "$archivo" > "${archivo}_mod"
    echo "Archivo modificado guardado en ${archivo}_mod"
fi

# ------------------ Punto 17 ------------------
# Convertir todas las letras minúsculas de un archivo a mayúsculas
echo "---------------- Punto 17 ----------------"
archivo="$1"
if [ -f "$archivo" ]; then
    tr '[:lower:]' '[:upper:]' < "$archivo" > "${archivo}_mayus"
    echo "Archivo convertido a mayusculas: ${archivo}_mayus"
fi

# ------------------ Punto 18 ------------------
# Borrar lineas 2 a 5 de cada archivo ordinario de un directorio, dejar nuevos archivos en "ar-modificados"
echo "---------------- Punto 18 ----------------"
dir="$1"
mkdir -p ar-modificados
for f in "$dir"/*; do
    [ -f "$f" ] && sed '2,5d' "$f" > ar-modificados/"$(basename "$f")-m"
done

# ------------------ Punto 19 ------------------
# Insertar 3 espacios al principio de cada línea de todos los archivos ordinarios de un directorio
echo "---------------- Punto 19 ----------------"
dir="$1"
for f in "$dir"/*; do
    [ -f "$f" ] && sed 's/^/   /' "$f" > "${f}-esp"
done

# ------------------ Punto 20 ------------------
# Copiar archivos ejecutables de tp2 a "execu" y no ejecutables a "no-execu"; generar listado
echo "---------------- Punto 20 ----------------"
mkdir -p execu no-execu
for f in ~/documentos/practicas/tp2/*; do
    if [ -f "$f" ]; then
        if [ -x "$f" ]; then cp "$f" execu; else cp "$f" no-execu; fi
    fi
done
ls execu > execu/listado.txt
ls no-execu > no-execu/listado.txt
echo "Archivos copiados y listados generados en execu y no-execu"

# ------------------ Anexo Punto 1 ------------------
# Verificar si un string esta en un archivo y comprobar existencia
echo "---------------- Anexo Punto 1 ----------------"
archivo="$1"
cadena="$2"
if [ -f "$archivo" ] && [ -n "$cadena" ]; then
    if grep -q "$cadena" "$archivo"; then
        echo "El string '$cadena' esta en el archivo $archivo"
    else
        echo "El string '$cadena' no esta en el archivo $archivo"
    fi
fi

# ------------------ Anexo Punto 2 ------------------
# Mostrar las primeras 5 lineas de cada archivo ordinario de un directorio y guardar en un archivo
echo "---------------- Anexo Punto 2 ----------------"
dir="$1"
for f in "$dir"/*; do
    [ -f "$f" ] && head -5 "$f" >> "$dir"/primeras5.txt
done

# ------------------ Anexo Punto 3 ------------------
# Solicitar un numero y guardar los 6 siguientes en orden inverso en archivo "num"
echo "---------------- Anexo Punto 3 ----------------"
read -rp "Ingrese un numero: " num
for i in $(seq $((num+6)) -1 $((num+1))); do echo "$i"; done > num

# ------------------ Anexo Punto 4 ------------------
# Imprimir una palabra 10 veces y guardarla en archivo "word", luego comprimirlo
echo "---------------- Anexo Punto 4 ----------------"
palabra="$1"
if [ -z "$palabra" ]; then
    echo "Debe pasar una palabra como parametro"
else
    for i in {1..10}; do
        echo "$palabra" | tee -a word
    done
    tar -czvf word.tar.gz word
fi

# ------------------ Anexo Punto 5 ------------------
# Comprobar si un usuario tiene como shell bash
echo "---------------- Anexo Punto 5 ----------------"
usuario="$1"
if [ -n "$usuario" ]; then
    shell_usr=$(getent passwd "$usuario" | cut -d: -f7)
    if [ "$shell_usr" = "/bin/bash" ]; then
        echo "$usuario tiene bash"
    else
        echo "$usuario tiene shell: $shell_usr"
    fi
fi

# ------------------ Anexo Punto 6 ------------------
# Mostrar tamaño de un archivo pasado como parametro
echo "---------------- Anexo Punto 6 ----------------"
archivo="$1"
if [ -f "$archivo" ]; then
    echo "Tamaño del archivo $archivo: $(stat -c%s "$archivo") bytes"
fi

# ------------------ Anexo Punto 7 ------------------
# Leer un archivo linea por linea, mostrar por terminal y guardar en "copia" con 3 segundos de retardo
echo "---------------- Anexo Punto 7 ----------------"
archivo="$1"
while IFS= read -r linea; do
    echo "$linea"
    echo "$linea" >> copia
    sleep 3
done < "$archivo"

# ------------------ Anexo Punto 8 ------------------
# Guardar nombres de archivos comunes de un directorio y contar cantidad, guardar contador al final
echo "---------------- Anexo Punto 8 ----------------"
dir="$1"
if [ -d "$dir" ]; then
    count=0
    > solo-archi
    for f in "$dir"/*; do
        [ -f "$f" ] && echo "$(basename "$f")" >> solo-archi && ((count++))
    done
    echo "$count" >> solo-archi
fi

# ------------------ Anexo Punto 9 ------------------
# Guardar en "perm" archivos con permisos 755 y en "exten" archivos con extension .conf de un directorio
echo "---------------- Anexo Punto 9 ----------------"
dir="$1"
if [ -d "$dir" ]; then
    find "$dir" -type f -perm 755 -exec basename {} \; > perm
    find "$dir" -type f -name "*.conf" -exec basename {} \; > exten
fi

# ------------------ Anexo Punto 10 ------------------
# Calcular cantidad de lineas de cada archivo de un directorio y total, guardar en TOT_GENERAL
echo "---------------- Anexo Punto 10 ----------------"
dir="$1"
total=0
> TOT_GENERAL
for f in "$dir"/*; do
    if [ -f "$f" ]; then
        lineas=$(wc -l < "$f")
        echo "$(basename "$f") $lineas" >> TOT_GENERAL
        total=$((total+lineas))
    fi
done
echo "Total lineas: $total" >> TOT_GENERAL

echo "Todos los puntos de la Practica 3 ejecutados."