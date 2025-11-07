# Manipulación de Archivos y Directorios en Bash

Principales comandos utilizados en los scripts para **manipulación de archivos y directorios** en Bash, según los trabajos prácticos realizados.

---

## Comandos para archivos

- **`ls`**  
  Lista archivos y directorios en el directorio actual o especificado.

- **`cat`**  
  Muestra el contenido de un archivo.

- **`head`**  
  Muestra las primeras líneas de un archivo.  
  Ejemplo: `head -n 10 archivo.txt` muestra las primeras 10 líneas.

- **`tail`**  
  Muestra las últimas líneas de un archivo.

- **`wc`**  
  Cuenta líneas, palabras o caracteres en un archivo.  
  Ejemplo: `wc -l archivo.txt` cuenta las líneas.

- **`stat`**  
  Muestra información detallada de un archivo, incluyendo tamaño en bytes.  
  Ejemplo: `stat -c %s archivo.txt` devuelve solo el tamaño.

- **`cp`**  
  Copia archivos o directorios.  
  Ejemplo: `cp archivo1 archivo2` o `cp -r dir1 dir2`.

- **`mv`**  
  Mueve o renombra archivos/directorios.

- **`rm`**  
  Elimina archivos o directorios.  
  Ejemplo: `rm archivo.txt`, `rm -r directorio`.

- **`chmod`**  
  Cambia los permisos de archivos o directorios.  
  Ejemplo: `chmod 755 archivo.sh`.

- **`basename`**  
  Obtiene solo el nombre del archivo sin la ruta.  
  Ejemplo: `basename /ruta/archivo.txt` → `archivo.txt`.

- **`grep`**  
  Busca patrones de texto dentro de archivos.  
  Ejemplo: `grep "bash" archivo.txt` muestra líneas que contienen "bash".

- **`find`**  
  Busca archivos y directorios según criterios.  
  Ejemplo: `find /ruta -type f -name "*.txt"` busca todos los `.txt`.

---

## Comandos para directorios

- **`mkdir`**  
  Crea directorios.  
  Ejemplo: `mkdir nuevo_directorio`.

- **`rmdir`**  
  Elimina directorios vacíos.

- **`pwd`**  
  Muestra la ruta absoluta del directorio actual.

- **`cd`**  
  Cambia de directorio.

- **`tar`**  
  Empaqueta y comprime archivos o directorios.  
  Ejemplo: `tar -czvf archivo.tar.gz directorio/`.

- **`du`**  
  Muestra el tamaño de archivos y directorios.  
  Ejemplo: `du -h archivo.txt` o `du -sh directorio/`.

---

## Conceptos aplicados

- Uso de **bucles `for`** para iterar sobre archivos/directorios.
- Contadores y acumuladores para estadísticas de archivos.
- Creación de **archivos temporales** para manipulación de contenido.
- Copia selectiva de archivos según criterios (líneas, tamaño, permisos, extensión).
- Generación de reportes y empaquetado de archivos para respaldo.