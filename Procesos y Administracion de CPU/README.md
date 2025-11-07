# Procesos y Administración de CPU en Bash

Principales comandos utilizados en los scripts para **gestión de procesos y administración del uso de CPU** en Bash, según los trabajos prácticos realizados.

---

## Comandos para gestión de procesos

- **`ps`**  
  Muestra información de los procesos activos.  
  Ejemplo: `ps -eo pid,user,%cpu,%mem,comm` muestra PID, usuario, CPU, memoria y comando.

- **`top`**  
  Muestra en tiempo real los procesos que consumen más CPU y memoria.

- **`htop`**  
  Similar a `top`, pero con una interfaz más amigable e interactiva.

- **`pgrep`**  
  Busca el PID de un proceso por nombre.  
  Ejemplo: `pgrep firefox` devuelve el PID del proceso *firefox*.

- **`pidof`**  
  Devuelve el PID del proceso especificado.  
  Ejemplo: `pidof bash`.

- **`kill`**  
  Envía una señal a un proceso (por defecto, termina su ejecución).  
  Ejemplo: `kill 1234` finaliza el proceso con PID 1234.

- **`pkill`**  
  Termina procesos según nombre o usuario.  
  Ejemplo: `pkill -u usuario` mata todos los procesos de ese usuario.

- **`killall`**  
  Termina todos los procesos con el mismo nombre.  
  Ejemplo: `killall firefox`.

- **`nice`**  
  Inicia un proceso con una prioridad determinada.  
  Ejemplo: `nice -n 10 ./script.sh`.

- **`renice`**  
  Cambia la prioridad de un proceso ya en ejecución.  
  Ejemplo: `renice +5 -p 1234`.

- **`watch`**  
  Ejecuta un comando repetidamente para monitorear su salida.  
  Ejemplo: `watch -n 5 "ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head"`.

- **`sleep`**  
  Pausa la ejecución durante un tiempo determinado.  
  Ejemplo: `sleep 5` pausa por 5 segundos.

- **`uptime`**  
  Muestra el tiempo que lleva encendido el sistema y la carga promedio del CPU.

---

## Comandos para control y monitoreo de CPU

- **`top` / `htop`**  
  Permiten ver el uso de CPU y memoria en tiempo real por proceso.

- **`ps` con filtros**  
  Se puede combinar con `awk` o `grep` para mostrar procesos con alto consumo.  

- **`vmstat`**  
  Muestra estadísticas del uso de CPU, memoria, y procesos.

- **`sar`**  
  (De sysstat) Registra y reporta actividad del sistema, útil para análisis prolongados.

---

## Conceptos aplicados

- Detección de procesos en ejecución mediante `pgrep` o `ps`.  
- Finalización controlada de procesos con `kill`, `pkill` o `killall`.  
- Monitoreo periódico usando `watch` o bucles con `sleep`.  
- Identificación de procesos con alto consumo de CPU.  
- Generación de reportes automáticos mediante redirección de salida.  
- Automatización de acciones según condiciones de uso.  
- Control de prioridad y equilibrio de carga con `nice` y `renice`.
