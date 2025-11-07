# Administración del Sistema

Este módulo aborda los comandos esenciales para la gestión, control y mantenimiento del sistema operativo GNU/Linux. Incluye monitoreo de recursos, manejo de procesos, usuarios, red y almacenamiento.

---

## Procesos

- `ps` → Muestra los procesos activos del sistema.  
- `top` → Visualiza en tiempo real el uso de CPU, memoria y procesos.  
- `htop` → Versión interactiva avanzada de `top`.  
- `kill` → Finaliza procesos por PID.  
- `nice` / `renice` → Cambia la prioridad de ejecución de un proceso.  
- `jobs` / `bg` / `fg` → Control de procesos en segundo plano.  
- `pidof` → Muestra el PID de un proceso en ejecución.  
- `pgrep` / `pkill` → Busca o finaliza procesos según su nombre.  

---

## Memoria y CPU

- `free` → Muestra información sobre la memoria RAM y Swap.  
- `vmstat` → Reporta estadísticas de memoria, procesos y CPU.  
- `mpstat` → Muestra el uso de CPU por núcleo.  
- `uptime` → Indica el tiempo encendido y la carga promedio del sistema.  
- `lscpu` → Detalla información del procesador.  
- `sysctl` → Permite modificar parámetros del kernel en tiempo real.  
- `cat /proc/meminfo` → Información detallada del uso de memoria.  

---

## Disco y Sistema de Archivos

- `df` → Muestra el espacio disponible en los sistemas de archivos.  
- `du` → Indica el tamaño de archivos y directorios.  
- `lsblk` → Lista dispositivos de bloques (discos, particiones).  
- `mount` / `umount` → Monta o desmonta sistemas de archivos.  
- `blkid` → Muestra UUID y tipo de partición.  
- `fdisk` / `parted` → Utilidades para gestionar particiones.  
- `sync` → Sincroniza los datos en memoria con el disco.  

---

## Red y Conectividad

- `ifconfig` / `ip addr` → Muestra configuración de interfaces de red.  
- `ping` → Verifica la conectividad con otra máquina.  
- `netstat` / `ss` → Muestra puertos y conexiones activas.  
- `nslookup` / `dig` → Consultas DNS.  
- `traceroute` → Rastrea la ruta hacia un host remoto.  
- `route` → Muestra o modifica la tabla de enrutamiento.  
- `curl` / `wget` → Descarga o consulta recursos web desde la terminal.  

---

## Usuarios y Permisos

- `who` / `w` / `users` → Muestran usuarios conectados.  
- `id` / `groups` → Información de usuario y grupos.  
- `useradd` / `userdel` / `usermod` → Administración de cuentas.  
- `passwd` → Cambia la contraseña de un usuario.  
- `chmod` → Modifica permisos de archivos y directorios.  
- `chown` → Cambia propietario y grupo.  
- `sudo` → Ejecuta comandos con privilegios administrativos.  

---

## Logs y Monitoreo del Sistema

- `dmesg` → Muestra mensajes del kernel.  
- `journalctl` → Revisa los registros del sistema (systemd).  
- `tail -f /var/log/syslog` → Visualiza logs en tiempo real.  
- `last` → Muestra los últimos inicios de sesión.  
- `uptime` → Indica carga y tiempo de actividad.  
- `sar` → Muestra estadísticas de rendimiento del sistema.  

---

## Automatización y Tareas

- `cron` / `crontab` → Programa tareas automáticas.  
- `at` → Ejecuta comandos en un momento específico.  
- `sleep` → Retrasa la ejecución de un comando.  
- `watch` → Ejecuta un comando periódicamente mostrando la salida.  
- `systemctl` → Controla servicios y unidades en sistemas con systemd.  

---

## Mantenimiento del Sistema

- `shutdown` / `reboot` → Apaga o reinicia el sistema.  
- `hostnamectl` → Configura el nombre del equipo.  
- `timedatectl` → Administra la fecha y hora del sistema.  
- `service` → Inicia o detiene servicios del sistema.  
- `update-grub` → Actualiza el cargador de arranque.  
- `apt`, `dnf`, `yum`, `zypper` → Gestores de paquetes según la distribución.  

---

## Información del Sistema

- `uname -a` → Muestra información del kernel y arquitectura.  
- `lsb_release -a` → Muestra versión de la distribución.  
- `hostname` → Devuelve el nombre del equipo.  
- `uptime` → Tiempo encendido y carga promedio.  
- `top` → Monitoreo de recursos en tiempo real.  