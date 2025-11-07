#!/bin/bash
# Trabajo Practico Nº 6 - Administracion e instalacion de servicios en Linux (solo bash)

mkdir -p ~/documentos/practicas/tp6
cd ~/documentos/practicas/tp6 || exit

# ------------------ Punto 1 ------------------
echo "---------------- Punto 1 ----------------"
# Instalar Apache2
if ! command -v apache2 &> /dev/null; then
    echo "Instalando Apache2..."
    sudo apt update && sudo apt install -y apache2
else
    echo "Apache2 ya esta instalado"
fi
sudo systemctl enable apache2
sudo systemctl start apache2
echo "Apache2 iniciado y habilitado"

# ------------------ Punto 2 ------------------
echo "---------------- Punto 2 ----------------"
# Identificar puertos usados por http
sudo netstat -tulpn | grep apache2 || sudo netstat -tulpn | grep httpd

# ------------------ Punto 3 ------------------
echo "---------------- Punto 3 ----------------"
# Instalar CRON si no esta instalado
if ! command -v cron &> /dev/null; then
    echo "Instalando cron..."
    sudo apt install -y cron
    sudo systemctl enable cron
    sudo systemctl start cron
else
    echo "Cron ya esta instalado y activo"
fi
echo "Archivo crontab de usuario actual:"
crontab -l

# ------------------ Punto 4 ------------------
echo "---------------- Punto 4 ----------------"
# Script para generar archivo cada 2 minutos usando cron
echo "*/2 * * * * touch ~/documentos/practicas/tp6/archi\$(date +\%H-\%M-\%S)" > mi_cron
crontab mi_cron
echo "Crontab seteado para generar archivo cada 2 minutos. Luego de probar, limpiar con crontab -r"

# ------------------ Punto 5 ------------------
echo "---------------- Punto 5 ----------------"
# Backup de TP1, TP2, TP3 los dias habiles a 0 horas
mkdir -p backups
fecha=$(date +%Y-%m-%d)
for tp in TP1 TP2 TP3; do
    if [ -d ~/documentos/practicas/"$tp" ]; then
        tar -czvf backups/"${tp}_backup_$fecha.tar.gz" -C ~/documentos/practicas "$tp"
    fi
done
echo "Backups generados en carpeta backups"

# ------------------ Punto 6 ------------------
echo "---------------- Punto 6 ----------------"
# Cantidad de usuarios conectados, tiempo de encendido y carga
echo "Usuarios conectados: $(who | wc -l)"
echo "Tiempo de encendido y promedio de carga:"
uptime

# ------------------ Punto 7 ------------------
echo "---------------- Punto 7 ----------------"
# Direccion fisica, IP y mascara de subred
if command -v ifconfig &> /dev/null; then
    ifconfig | awk '/ether/ {print "MAC: "$2} /inet / {print "IP: "$2, "Mascara: "$4}'
else
    echo "ifconfig no disponible, usando ip addr"
    ip addr | awk '/link\/ether/ {print "MAC: "$2} /inet / {print "IP: "$2}'
fi

# ------------------ Punto 8 ------------------
echo "---------------- Punto 8 ----------------"
# Prueba de conectividad a IP pasada por parametro
ip="$1"
if [ -z "$ip" ]; then
    echo "Indique IP como parametro"
else
    if ping -c 4 "$ip" &> /dev/null; then
        echo "Conectividad con $ip: OK"
        ping -c 4 "$ip" | tail -1 | awk -F '/' '{print "RTT min: "$4" ms, avg: "$5" ms, max: "$6" ms"}'
    else
        echo "No hay conectividad con $ip"
    fi
fi

# ------------------ Punto 9 ------------------
echo "---------------- Punto 9 ----------------"
# Filtrado de dmesg por parametro
filtro="$1"
if [ -z "$filtro" ]; then
    echo "Ingrese filtro: emerg, alert, crit, err, warn, notice, info, debug"
else
    sudo dmesg | grep "$filtro"
fi

# ------------------ Punto 10 ------------------
echo "---------------- Punto 10 ----------------"
# Usuarios conectados
who > conectados
usuario="$1"
if [ -n "$usuario" ]; then
    grep "$usuario" conectados
else
    cat conectados
fi

# ------------------ Punto 11 ------------------
echo "---------------- Punto 11 ----------------"
# Usuarios conectados en el ultimo mes
usuario="$1"
if [ -z "$usuario" ]; then
    echo "Indique usuario como parametro"
else
    last "$usuario" | grep "$(date +%b)"  # muestra registros del mes actual
fi

# ------------------ Punto 12 ------------------
echo "---------------- Punto 12 ----------------"
# Generar archivo con info de arquitectura, nombre, SO y kernel
info_arch=$(uname -m)
info_maquina=$(hostname)
info_so=$(lsb_release -d | awk -F: '{print $2}' | xargs)
info_kernel=$(uname -r)
echo "Arquitectura: $info_arch" > info_sistema.txt
echo "Nombre de maquina: $info_maquina" >> info_sistema.txt
echo "Sistema operativo: $info_so" >> info_sistema.txt
echo "Version del kernel: $info_kernel" >> info_sistema.txt
echo "Informacion del sistema guardada en info_sistema.txt"