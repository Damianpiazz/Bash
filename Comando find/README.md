# Comando `find` en Linux

El comando `find` es una herramienta muy poderosa en sistemas Unix/Linux que permite **buscar archivos y directorios** dentro de un árbol de directorios según criterios específicos como nombre, tipo, permisos, tamaño, fecha de modificación y más.

Este README explica su uso básico y algunas de las opciones más importantes.

---

## Sintaxis básica

```bash
find [ruta] [opciones] [expresión]
```

* **ruta**: Directorio donde se iniciará la búsqueda. Puede ser `.` para el directorio actual.
* **opciones/expresión**: Condiciones para filtrar archivos o acciones a realizar.

---

## Ejemplos comunes

### 1. Buscar archivos por tipo

```bash
find . -type f
```

* `-type f` → Archivos normales
* `-type d` → Directorios

---

### 2. Buscar archivos por nombre

```bash
find /home -name "*.txt"
```

* `-name` → Busca archivos que coincidan con el patrón.
* Se puede usar comodín `*` para coincidencias parciales.

```bash
find /home -iname "*.txt"
```

* `-iname` → Igual que `-name` pero **ignora mayúsculas y minúsculas**.

---

### 3. Buscar por permisos

```bash
find . -type f -perm 755
```

* Archivos con permisos exactos `rwxr-xr-x`.

```bash
find . -type f -perm /g=x
```

* Archivos que tengan **ejecución para el grupo** (sin importar otros permisos).

---

### 4. Buscar por fecha de modificación

```bash
find . -type f -mtime -2
```

* Archivos modificados en los últimos 2 días (`-2` significa "menos de 2 días").
* `+2` → Modificados hace más de 2 días.

---

### 5. Buscar por tamaño

```bash
find . -type f -size +500k
```

* Archivos mayores a 500 KB (`+` significa mayor, `-` significa menor).
* Puedes usar `c` (bytes), `k` (kilobytes), `M` (megabytes), `G` (gigabytes).

---

### 6. Ejecutar acciones sobre los archivos encontrados

```bash
find . -type f -name "*.log" -exec rm {} \;
```

* `-exec` → Ejecuta un comando sobre cada archivo encontrado.
* `{}` → Representa el archivo encontrado.
* `\;` → Termina el comando `-exec`.

Otros ejemplos:

```bash
find . -type f -name "*.txt" -exec cp {} /ruta/destino/ \;
find . -type f -size +1M -exec ls -lh {} \;
```

---

### 7. Buscar archivos vacíos

```bash
find . -type f -empty
```

* Archivos sin contenido.

```bash
find . -type d -empty
```

* Directorios vacíos.

---

### 8. Buscar archivos recientes y específicos (ejemplo avanzado)

```bash
find /home/usuario -type f -mtime -2 -perm /g=x
```

* Archivos modificados en los últimos 2 días
* Con permiso de ejecución para el grupo

> Este ejemplo se utiliza en scripts para generar reportes de archivos recientes con permisos específicos.

---

## Consejos útiles

* Siempre prueba `find` primero sin `-exec` para **ver qué archivos se seleccionan**.
* Combina `find` con `xargs` para ejecutar comandos de forma más eficiente:

```bash
find . -name "*.log" -print0 | xargs -0 rm
```

* Usa `-maxdepth` para limitar la profundidad de búsqueda:

```bash
find . -maxdepth 2 -type f
```

---

## Referencias

* `man find` → Página de manual oficial de `find`.
* GNU Find Utilities: [https://www.gnu.org/software/findutils/manual/find.html](https://www.gnu.org/software/findutils/manual/find.html)

---

> Con `find`, prácticamente puedes **buscar, filtrar y manipular archivos** de cualquier manera imaginable en Linux. Es una herramienta imprescindible para administración de sistemas y scripting.
