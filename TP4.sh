#!/bin/bash
# Trabajo Practico Nº 4

mkdir -p ~/documentos/practicas/tp4
cd ~/documentos/practicas/tp4 || exit

# ------------------ Punto 3 ------------------
# Crear archivo 'process', agregar procesos en ejecucion, extraer usuario y PID, comprimir todo
echo "---------------- Punto 3 ----------------"
touch process
ps aux > process
awk '{print $1, $2}' process > solousu
tar -czvf proc-usu.tar.gz process solousu
echo "Archivo proc-usu.tar.gz creado con process y solousu"

# ------------------ Punto 4 ------------------
# Mostrar procesos de un usuario, con manejo de errores y root
echo "---------------- Punto 4 ----------------"
usuario="$1"
if [ -z "$usuario" ]; then
    echo "Mostrando todos los procesos:"
    ps aux
elif [ "$usuario" = "root" ]; then
    echo "Error: No se puede mostrar procesos de root"
else
    echo "Procesos del usuario $usuario:"
    ps -u "$usuario"
fi

# ------------------ Punto 5 ------------------
# Bucle infinito, ejecutar en segundo plano, ver proceso y matarlo
echo "---------------- Punto 5 ----------------"
# Crear script infinito
echo -e "#!/bin/bash\nwhile true; do :; done" > bucle_infinito.sh
chmod +x bucle_infinito.sh
# Ejecutar en segundo plano
./bucle_infinito.sh &
PID_BUCLE=$!
echo "Proceso en segundo plano con PID: $PID_BUCLE"
# Ver procesos
ps -p $PID_BUCLE
# Ver proceso online con top
echo "Ejecute: top -p $PID_BUCLE para ver en tiempo real"
# Matar proceso
kill $PID_BUCLE
echo "Proceso $PID_BUCLE finalizado"

# ------------------ Punto 6 ------------------
# Iteracion de 1 a 10, cortar en el parametro pasado
echo "---------------- Punto 6 ----------------"
corte="$1"
for i in $(seq 1 10); do
    echo "$i"
    sleep 1
    if [ "$i" -eq "$corte" ]; then
        echo "Iteracion cortada en $i"
        break
    fi
done

# ------------------ Punto 14 ------------------
# Adivinar PID del script
echo "---------------- Punto 14 ----------------"
PID_SCRIPT=$$
intentos=0
while true; do
    read -rp "Adivine el PID del script: " guess
    ((intentos++))
    if [ "$guess" -lt "$PID_SCRIPT" ]; then
        echo "Mayor"
    elif [ "$guess" -gt "$PID_SCRIPT" ]; then
        echo "Menor"
    else
        echo "Correcto! PID: $PID_SCRIPT, intentos: $intentos"
        break
    fi
done

echo "Todos los ejercicios de bash del TP4 han sido ejecutados/creados"
