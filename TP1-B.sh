#!/bin/bash
# Script para realizar todas las acciones de la PARTE B

# 1. Crear directorio practicas en home
cd ~
mkdir -p practicas

# 2. Crear directorio tp1 dentro de practicas
mkdir -p practicas/tp1

# 3. Crear el archivo perfil.txt dentro de tp1
touch practicas/tp1/perfil.txt

# 4. Crear usuario "admi" y darle privilegios
sudo useradd -m admi
sudo passwd admi
sudo usermod -aG sudo admi

# 5. Copiar /etc/passwd y /etc/group a tp1 como usuarios y grupos
cp /etc/passwd practicas/tp1/usuarios
cp /etc/group practicas/tp1/grupos

# 6. Extraer UID, GID y shell del usuario admi y guardar en perfil.txt
grep "^admi:" practicas/tp1/usuarios | awk -F: '{print "UID="$3, "GID="$4, "SHELL="$7}' > practicas/tp1/perfil.txt

# 7. Cambiar fecha de acceso de perfil.txt a 2024-03-06
touch -a -t 202403060000 practicas/tp1/perfil.txt

# 8. Mostrar primeras 2 lineas de usuarios
head -n 2 practicas/tp1/usuarios

# 9. Mostrar ultimas 4 lineas de grupos
tail -n 4 practicas/tp1/grupos

# 10. Mostrar contenido de /etc/fstab y redireccionar a filesystem.txt
cat /etc/fstab > practicas/tp1/filesystem.txt

# 11. Contar lineas, palabras y caracteres de filesystem.txt y guardar en cantidad
wc practicas/tp1/filesystem.txt > practicas/tp1/cantidad

# 12. Guardar history en cmd.txt
history > practicas/tp1/cmd.txt

# 13. Renombrar cmd.txt a hist.txt
mv practicas/tp1/cmd.txt practicas/tp1/hist.txt

# 14. Buscar registro de admi en usuarios y guardar en newusuario
grep "^admi:" practicas/tp1/usuarios > practicas/tp1/newusuario

# 15. Copiar directorio tp1 a tp1-temp
cp -r practicas/tp1 practicas/tp1-temp

# 16. Copiar documento de PARTE A a tp1 como Practica1ParteA.txt
# Modificar la ruta /ruta/del/documento/ParteA.txt segun corresponda
cp /ruta/del/documento/ParteA.txt practicas/tp1/Practica1ParteA.txt

# 17. Comprimir tp1 en tp1.tar.gz dentro de practicas
cd ~/practicas
tar -czvf tp1.tar.gz tp1

# 18. Borrar directorio tp1-temp
rm -rf tp1-temp

echo "Script completado correctamente."