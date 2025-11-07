#!/bin/bash
# Trabajo Practico Nº 5

mkdir -p ~/documentos/practicas/tp5
cd ~/documentos/practicas/tp5 || exit

# ------------------ Punto 4 ------------------
echo "---------------- Punto 4 ----------------"
# Informe de memoria usando free
free -h > "Informe de RAM"
echo "Informe de RAM creado:"
cat "Informe de RAM"

# ------------------ Punto 5 ------------------
echo "---------------- Punto 5 ----------------"
# a) Procesos esperando por CPU (estado R)
ps -eo state,pid,comm | grep " R" > procesos_esperando_cpu.txt
echo "Procesos esperando por CPU:"
cat procesos_esperando_cpu.txt

# b) Procesos en estado dormido (estado S)
ps -eo state,pid,comm | grep " S" > procesos_dormidos.txt
echo "Procesos en estado dormido:"
cat procesos_dormidos.txt

# c) Revisar uso de swap por los procesos
echo "Uso de swap por proceso (en KB):"
for pid in $(ps -eo pid --no-headers); do
    sw=$(grep VmSwap /proc/$pid/status 2>/dev/null | awk '{print $2}')
    [ -n "$sw" ] && echo "PID $pid usa $sw KB swap"
done

# d) y e) Memoria intercambiada desde y hacia disco
echo "Memoria intercambiada desde disco:"
cat /proc/vmstat | grep pgpgin
echo "Memoria intercambiada hacia disco:"
cat /proc/vmstat | grep pgpgout

# ------------------ Punto 6 ------------------
echo "---------------- Punto 6 ----------------"
# Habilitar o deshabilitar swap
accion="$1"  # "on" para habilitar, "off" para deshabilitar
if [ "$accion" = "on" ]; then
    sudo swapon -a
    echo "Memoria swap habilitada"
elif [ "$accion" = "off" ]; then
    sudo swapoff -a
    echo "Memoria swap deshabilitada"
else
    echo "Indique parametro 'on' para habilitar o 'off' para deshabilitar swap"
fi

# ------------------ Punto 7 ------------------
echo "---------------- Punto 7 ----------------"
# Cambiar niveles de intercambio entre RAM y swap
echo "Seleccione nivel de intercambio:"
echo "0) 0%"
echo "1) 50%"
echo "2) 100%"
read -rp "Opcion: " nivel
case $nivel in
    0) sudo sysctl vm.swappiness=0 ;;
    1) sudo sysctl vm.swappiness=50 ;;
    2) sudo sysctl vm.swappiness=100 ;;
    *) echo "Opcion invalida" ;;
esac
echo "Nivel de intercambio configurado: $(cat /proc/sys/vm/swappiness)"

# ------------------ Punto 8 ------------------
echo "---------------- Punto 8 ----------------"
# Chequear memoria libre cada 5 segundos y alertar si llega a valor
umbral="$1"  # en MB
echo "Monitoreando memoria libre, alerta si <= ${umbral}MB"
while true; do
    libre=$(free -m | awk '/^Mem:/ {print $7}')  # Memoria disponible
    echo "Memoria libre actual: ${libre} MB"
    if [ "$libre" -le "$umbral" ]; then
        echo "ALERTA: memoria libre <= ${umbral} MB"
        break
    fi
    sleep 5
done

# ------------------ Punto 9 ------------------
echo "---------------- Punto 9 ----------------"
# Guardar estado de memoria y liberar según parametro
echo "Estado actual de memoria:" > mem-actual
free -h >> mem-actual

echo "Seleccione nivel de liberacion:"
echo "0) Nada"
echo "1) Pagecache"
echo "2) Inodos y dentries"
echo "3) Pagecache, inodos y dentries"
read -rp "Opcion: " liberacion
case $liberacion in
    0) echo "No se libera memoria" ;;
    1) sudo sh -c "echo 1 > /proc/sys/vm/drop_caches" ;;
    2) sudo sh -c "echo 2 > /proc/sys/vm/drop_caches" ;;
    3) sudo sh -c "echo 3 > /proc/sys/vm/drop_caches" ;;
    *) echo "Opcion invalida" ;;
esac
free -h > mem-limpia
echo "Estado de memoria antes y despues guardado en mem-actual y mem-limpia"

# ------------------ Punto 10 ------------------
echo "---------------- Punto 10 ----------------"
# Verificar si dmidecode esta instalado
if ! command -v dmidecode &> /dev/null; then
    echo "dmidecode no esta instalado, instalando..."
    sudo apt update && sudo apt install -y dmidecode
fi
echo "Informacion de memoria maxima:"
sudo dmidecode -t 16 -t 17 | grep -E "Maximum Capacity|Size"
