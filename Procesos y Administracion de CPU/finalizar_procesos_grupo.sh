#!/bin/bash

# Descripción: Termina todos los procesos de todos los usuarios que pertenecen a un grupo
# especificado. Si no se pasa un grupo como parámetro, finaliza los procesos
# del grupo de usuarios "staff".

# Verificar si se pasó un grupo como parámetro
if [ -n "$1" ]; then
    grupo="$1"              # Si se pasa un parámetro, se usa como nombre del grupo
else
    grupo="staff"           # Si no se pasa, se usa "staff" por defecto
fi

# Obtener todos los usuarios que pertenecen al grupo especificado
# getent group obtiene la línea del grupo del archivo /etc/group
# cut -d: -f4 extrae la lista de usuarios (campo 4, separados por coma)
usuarios=$(getent group "$grupo" | cut -d: -f4)

# Iterar sobre cada usuario y terminar todos sus procesos
for usuario in $usuarios; do
    echo "Terminando todos los procesos de '$usuario'..."
    pkill -u "$usuario"    # pkill con la opción -u mata todos los procesos del usuario
done
