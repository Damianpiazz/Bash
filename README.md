# Bash

Repositorio dedicado a la materia **Sistemas Operativos** (UTN), enfocado en la creación y estudio de scripts en **BASH (Bourne-Again SHell)** para la administración, automatización y monitoreo de sistemas GNU/Linux.

Los scripts permiten automatizar tareas administrativas, manipular archivos, gestionar usuarios, procesos y redes, así como entender conceptos avanzados del intérprete de comandos y del entorno operativo.

---

## Índice de Contenido

El repositorio está organizado en carpetas temáticas, cada una abordando aspectos prácticos del scripting en BASH:

1. **Manejo de Archivos:** Scripts para crear, leer, copiar, mover, eliminar y manipular archivos y directorios.  
2. **Validaciones:** Scripts que muestran cómo verificar condiciones, tipos de archivos, existencia de comandos o argumentos, y manejo de errores.  
3. **Tareas Programadas:** Ejemplos de uso de `crontab` y automatización de tareas periódicas.  
4. **Manejo de Texto:** Scripts que trabajan con `cat`, `head`, `tail`, `sort`, `cut`, `grep`, y `wc` para procesar datos y archivos de texto.  
5. **Find:** Ejemplos avanzados de búsqueda de archivos según criterios de nombre, extensión, permisos, tamaño o fecha de modificación.  
6. **Administración del Sistema:** Scripts que automatizan el monitoreo de memoria, CPU, swap, procesos, usuarios y servicios del sistema.  
7. **Procesos:** Ejemplos de gestión de procesos, señales, prioridades, pausas (`sleep`) y obtención de IDs de proceso (`pgrep`, `$$`, `$!`).  
8. **Ejemplo de Interfaces:** Scripts que crean menús interactivos, formularios simples y selección de opciones mediante `select` y `read`.

---

## I. Contexto y Entorno Operativo

Este repositorio se conceptualiza como un conjunto de utilidades para la administración de sistemas operativos, con énfasis en GNU/Linux.

### 1. Requisitos del Sistema

- **Plataforma Base:** Optimizado para GNU/Linux, preferentemente la última versión de Ubuntu Mate.
- **Mantenimiento:** El sistema operativo debe estar actualizado mediante la línea de comandos.
- **Compatibilidad Windows:** Puede ejecutarse sobre WSL (Windows Subsystem for Linux).
- **Intérprete de Comandos:** BASH, instalado por defecto en la mayoría de sistemas GNU/Linux.

---

## II. Fundamentos del Scripting BASH

### 1. Estructura del Archivo

- **Shebang (`#!/bin/bash`):** Indica al sistema que use BASH como intérprete.
- **Comentarios (`#`):** Documentan el código; ignorados por el intérprete.

### 2. Métodos de Ejecución

- **Directo:** `bash <fichero_script>`
- **Como ejecutable:** Asignando permisos de ejecución `chmod +x script.sh` y ejecutando `/ruta/script.sh`.

### 3. Variables, Parámetros y Expansiones

#### A. Variables y Parámetros

- Declaración: `NOMBRE=valor`  
- Referencia: `$NOMBRE`  
- Variables posicionales: `$0, $1 ... $9, ${10}`  
- Parámetros especiales:
  - `$#`: Número de argumentos
  - `$?`: Código de salida de la última instrucción
  - `$$`: PID del shell
  - `$!`: PID del último proceso en segundo plano
- Listas de parámetros:
  - `$*`: Expande todos los argumentos en una palabra
  - `$@`: Expande todos los argumentos como palabras separadas

#### B. Expansiones Avanzadas

- **Expansión de parámetros:** `${var#patrón}`, `${var##patrón}`, `${var%patrón}`, `${var%%patrón}`, `${#var}`, `${var:offset:length}`
- **Sustitución de instrucciones:** `$(comando)` o `` `comando` ``
- **Expansión aritmética:** `$(( expresión ))`
- **Brace Expansion:** `a{d,c,b}e` → ade ace abe
- **Tilde Expansion:** `~` → directorio home
- **Globbing:** `*`, `?`, `[...]` para coincidencia de nombres de archivo

### 4. Estructuras Condicionales y Lógicas

#### A. Condicionales

- `if ... then ... elif ... else ... fi`  
- `case ... esac`  
- `select ... do ... done` para menús

#### B. Test Condicional (`[ ]` / `[[ ]]` / `test`)

| Tipo | Operador | Descripción |
|------|----------|------------|
| Cadenas | `-z`, `-n`, `==`, `!=` | Longitud, igualdad o desigualdad |
| Enteros | `-eq`, `-ne`, `-gt`, `-lt`, `-ge`, `-le` | Comparaciones numéricas |
| Ficheros | `-e`, `-f`, `-d`, `-s`, `-r`, `-w`, `-x`, `-L` | Existencia, tipo y permisos |
| Lógicos | `-a`, `-o`, `&&`, `||` | AND, OR |

#### C. Agrupación de Instrucciones

- `()` → subintérprete (variables locales no persisten)  
- `{ lista; }` → contexto actual (requerido `;` o nueva línea)

---

## III. Administración de Sistemas

### 1. Memoria y CPU

- `free` → Uso y disponibilidad de memoria  
- `swapon / swapoff` → Activar/desactivar swap  
- Liberación de caché → `/proc/sys/vm/drop_caches`  
- `uptime`, `ps`, `pgrep`, `kill`, `sleep` → Procesos y CPU  
- `dmidecode`, `uname` → Información de hardware y sistema

### 2. Redes y Conectividad

- `ifconfig` → IP y máscara de red  
- `ping` → Prueba de conectividad y RTT  
- `netstat` → Estado de conexiones y puertos

### 3. Archivos y Sistemas de Archivos

- `fdisk -l` → Gestión de particiones  
- `df -h` → Espacio usado/disponible  
- `ln -s` → Enlaces simbólicos  
- `stat` → Información detallada de archivos  
- `find` → Buscar archivos según nombre, permisos, tamaño, fecha

### 4. Manipulación de Datos y Texto

- `cat`, `head`, `tail`, `tail -f` → Visualización de archivos  
- `wc -l/-w/-c` → Conteo de líneas, palabras, caracteres  
- `sort`, `cut`, `grep` → Ordenar, extraer y filtrar

### 5. Usuarios y Tareas Programadas

- `who`, `last` → Información de usuarios y sesiones  
- `crontab -e/-l/-r` → Gestión de tareas programadas

---

## IV. Funcionalidades Avanzadas del Shell

### 1. Funciones y Comandos Integrados

- **Funciones:** Agrupan instrucciones; argumentos → parámetros posicionales  
- **Builtins:** Comandos internos (ej. `cd`, `break`)  
- **Búsqueda de comandos:** `$PATH`, `hash`, `type`

### 2. Historial y Readline

- `history` → Lista de comandos previos  
- `fc` → Editar y reejecutar comandos  
- Expansión de historial: `!!`, `!n`, `!-n`, `!cadena`, `^cadena1^cadena2^`  
- **Readline:** Edición de línea, mover cursor, cortar y pegar  
- Completado programable: `complete`  

### 3. Redirecciones y Tuberías

- `|` y `|&` → Encadenar comandos, redirigir errores  
- `time` → Medir tiempo de ejecución de comandos/tuberías  
- `pipefail` → Código de salida de tuberías

### 4. Modo Restringido y POSIX

- `rbash` → Shell restringido, limita acciones críticas  
- Modo POSIX → Comportamiento estándar para variables, funciones y errores

---

## V. Buenas Prácticas de Codificación

1. **Protección de cadenas:** Comillas dobles `" "` para variables con espacios  
2. **Entrecomillado literal:** Comillas simples `' '` para preservar valores  
3. **Sustitución segura:** `var=$(comando)`  
4. **Manejo de errores:** `set -e` y uso de `$?`  
5. **Variables locales vs globales:** `local` dentro de funciones  
6. **Documentación:** `help <builtin>` para instrucciones integradas

---

## VI. Ejecución de Scripts

1. Guardar el script con extensión `.sh`  
2. Dar permisos de ejecución:  
```bash
chmod +x script.sh
```
3. Ejecutar:
```bash
./script.sh
```
---

## Resumen de Contenido de los Trabajos Prácticos por Temáticas

### 1. Configuración, Entorno y Fundamentos Iniciales (TP 1 - Parte A)

- **Instalación y Entorno:**
  - Instalación de GNU/Linux (Ubuntu Mate) o WSL en Windows.  
  - Actualización del sistema operativo desde línea de comandos.  
- **Conceptos Teóricos:**
  - Finalidad de actualizar un sistema operativo.  
  - Descripción del gestor de arranque.  
  - Definición de intérprete de comandos y detección del instalado por defecto.  
- **Sistema de Archivos y Directorios:**
  - Descripción del directorio raíz `/` y subdirectorios.  
  - Listado del contenido de directorios con tres métodos distintos.  
- **Documentación y Redes:**
  - Acceso a ayuda/documentación de comandos.  
  - Investigación y uso de SSH.

### 2. Gestión de Archivos, Redirección y Usuarios (TP 1 - Parte B)

- **Organización de Directorios:** Creación de `prácticas/tp1/perfil.txt`.  
- **Administración de Usuarios y Grupos:**
  - Creación del usuario `admi` con privilegios.  
  - Copias de `/etc/passwd` y `/etc/group` como `usuarios` y `grupos`.  
  - Registro de UID, GID y shell en `perfil.txt`.  
- **Manipulación de Texto y Metadatos:**
  - Uso de `head`, `tail`, `wc`, `grep` y redirección de salidas.  
  - Cambio de fecha de acceso de archivos.  
- **Redirección y History:**  
  - Redirección de `/etc/fstab` a `filesystem.txt`.  
  - Guardado y renombrado del historial de comandos.  
- **Compresión y Estructura:**  
  - Comprimir directorios (`tp1`) y operaciones de copia/borrado.

### 3. Scripting BASH: Lógica y Estructuras (TP 2 y TP 3)

#### 3.1 Estructuras Condicionales y Variables

- Guardado de variables de entorno: `HOSTNAME, HOME, LOGNAME, PATH`.  
- Condicionales para comparar archivos y directorios.  
- Scripts de comparación de cadenas y palabra clave.  
- Operaciones aritméticas con entrada de usuario.

#### 3.2 Estructuras Repetitivas e Iteración

- Bucles básicos (1 al 20).  
- Contabilización de archivos y directorios.  
- Lectura de archivos línea por línea (`while`).  
- Simulación de alta de usuario y manipulación de líneas con retardo.

#### 3.3 Manipulación de Archivos en Scripts

- Filtrado, permisos y borrado de líneas o cadenas.  
- Conversión de mayúsculas/minúsculas y formateo de archivos.  
- Cambios de palabras dentro de archivos y creación de archivos modificados.

### 4. Administración de Procesos y Programación en C (TP 4)

- **Entorno C:** Instalación de GCC, rutinas simples.  
- **Gestión de Procesos BASH:** Uso de `ps`, `cut`, `pgrep`, bucles, ejecución en segundo plano y `kill`.  
- **Programación Avanzada en C:** Rutinas con `fork()`, procesos padre-hijo-abuelo, ejecución de comandos con `system()` y `execl()`.

### 5. Administración de Memoria y Sincronización (TP 5)

- **Sincronización en C:** Hilos (`pthreads`) y semáforos para exclusión mutua.  
- **Monitoreo de Memoria:** Scripts con `free`, `ps`, alertas por límite de memoria.  
- **Gestión de Swap:** Activación/desactivación y nivel de `swappiness`.  
- **Liberación de Caché:** Niveles de limpieza de memoria (`drop_caches`).  
- **Información de Hardware:** Uso de `dmidecode` para detectar capacidad máxima de memoria.

### 6. Redes, Sesiones y Tareas Programadas (TP 6)

- Instalación y monitoreo de Apache2 (`netstat`).  
- Scripts de red: `ifconfig`, `ping`.  
- Tareas programadas: `crontab` para backups y archivos con fecha/hora.  
- Información del sistema y sesiones: `uptime`, `who`, `last`, `uname`, `dmesg`.

### 7. Gestión de Discos y Sistema de Archivos Avanzado (TP 3 y TP 7)

- **Particiones y RAID:** Análisis de discos, particiones, tipos de RAID y capacidades.  
- **Búsqueda y Metadatos:** Uso de `find` y `stat` para archivos según criterios de nombre, extensión, permisos, tamaño y fecha.  
- **Manipulación de Archivos:** Tamaño de archivos, borrado por extensión, mover archivos con permisos específicos, identificar archivos más grandes.  
- **Enlaces y Estructura:** Creación de enlaces simbólicos (`ln -s`).

---

## Conexión Remota SSH al Contenedor de la Facultad

Para trabajar de forma remota en el entorno controlado del laboratorio de la facultad, se puede conectar mediante SSH usando el puerto 2222:

```bash
ssh usuario@IP_DEL_SERVIDOR -p 2222
```