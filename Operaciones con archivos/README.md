
## Operaciones con Archivos
<table>
   <tr>
      <td><a href="#a-cat">cat</a></td>
      <td><a href="#b-chmod">chmod</a></td>
      <td><a href="#c-chown">chown</a></td>
      <td><a href="#d-cp">cp</a></td>
      <td><a href="#e-diff">diff</a></td>
      <td><a href="#f-file">file</a></td>
      <td><a href="#g-find">find</a></td>
      <td><a href="#h-gunzip">gunzip</a></td>
      <td><a href="#i-gzcat">gzcat</a></td>
      <td><a href="#j-gzip">gzip</a></td>
      <td><a href="#k-head">head</a></td>
   </tr>
   <tr>
      <td><a href="#l-lpq">lpq</a></td>
      <td><a href="#m-lpr">lpr</a></td>
      <td><a href="#n-lprm">lprm</a></td>
      <td><a href="#o-ls">ls</a></td>
      <td><a href="#p-more">more</a></td>
      <td><a href="#q-mv">mv</a></td>
      <td><a href="#r-rm">rm</a></td>
      <td><a href="#s-tail">tail</a></td>
      <td><a href="#t-touch">touch</a></td>
   </tr>
</table>

### a. `cat`
Puede ser utilizado para los siguientes propositos bajo UNIX o Linux
  
* Mostrar archivos de texto en pantalla
* Copiar archivos de texto 
* Combinar archivos de texto 
* Crear nuevos archivos de texto 
```bash
cat nombredearchivo
cat archivo1 archivo2 
cat archivo1 archivo2 > nuevoarchivocombinado
cat < archivo1 > archivo2 #copiar archivo1 a archivo2
```

### b. `chmod`
El comando chmod significa "cambiar modo" y permite cambiar los permisos de lectura, escritura y ejecucion en los archivos y carpetas para mas información de este comando revisa este [enlace](https://ss64.com/bash/chmod.html).

```bash
chmod -options nombredearchivo
```

### c. `chown`
El comando chown significa "cambiar propietario" y permite cambiar el propietario de archivos y carpetas, los cuales pueden ser usuarios o grupos. El uso basico es muy simple, primero se especifica el usuario (propietario) y despues el grupo, separados por dos puntos. 

```bash
chown -options user:group nombredearchivo
```

### d. `cp`
Copia un archivo de un lugar a otro.
```bash
cp nombredearchivo1 nombredearchivo2
```
Donde `nombredearchivo1` es la ruta fuente a el archivo y   `nombredearchivo2` es la ruta destino del archivo.

### e. `diff`
Compara archivos y lista las diferencias.
 
```bash
diff nombredearchivo1 nombredearchivo2
```

### f. `file`
Determina el tipo de archivo.  
```bash
file filename
```
Ejemplo:
```bash
$ file index.html
 index.html: HTML document, ASCII text
```
### g. `find`
Encuentra archivos en un directorio
```bash
find directory options pattern
```
Ejemplo:
```bash
$ find . -name README.md
$ find /home/user1 -name '*.png'
```

### h. `gunzip`
Descomprime archivos comprimidos por gzip.
```bash
gunzip filename
```

### i. `gzcat`
Permite ver el contenido de un archivo gzipped sin tener que descomprimirlo.

```bash
gzcat filename
```

### j. `gzip`
Compresses files.  
```bash
gzip filename
```

### k. `head`
Outputs the first 10 lines of file  
```bash
head filename
```

### l. `lpq`
Revisar la cola de impresion.
```bash
lpq
```
Ejemplo:
```bash
$ lpq
Rank    Owner   Job     File(s)                         Total Size
active  adnanad 59      demo                            399360 bytes
1st     adnanad 60      (stdin)                         0 bytes
```

### m. `lpr`
Imprimir un archivo.
```bash
lpr filename
```

### n. `lprm`
Eliminar algo de la cola de impresion.  
```bash
lprm jobnumber
```

### o. `ls`
Lista archivos. `ls` tiene muchas opciones: `-l` lista archivos en 'formato largo', el cual contiene el tamaño exacto del archivo, quien es dueño del archivo, quien tiene permisos para verlo y cuando se modifico por ultima vez. `-a` lista todos los archivos, incluyendo los archivos ocultos. Para mas informacion de este comando revisa este [link](https://ss64.com/bash/ls.html).  

 
```bash
ls option
```
Ejemplo:
<pre>
$ ls -la
rwxr-xr-x   33 adnan  staff    1122 Mar 27 18:44 .
drwxrwxrwx  60 adnan  staff    2040 Mar 21 15:06 ..
-rw-r--r--@  1 adnan  staff   14340 Mar 23 15:05 .DS_Store
-rw-r--r--   1 adnan  staff     157 Mar 25 18:08 .bumpversion.cfg
-rw-r--r--   1 adnan  staff    6515 Mar 25 18:08 .config.ini
-rw-r--r--   1 adnan  staff    5805 Mar 27 18:44 .config.override.ini
drwxr-xr-x  17 adnan  staff     578 Mar 27 23:36 .git
-rwxr-xr-x   1 adnan  staff    2702 Mar 25 18:08 .gitignore
</pre>

### p. `more`

Despliega la primera parte de un archivo (desplazarse con espacio y presiona q para salir).

```bash
more filename
```

### q. `mv`
Mueve un archivo de una localizacion a otra
```bash
mv filename1 filename2
```
Donde `filename1`  es la ruta origen de el archivo y `filename2` es la ruta destino del archivo.

Tambien puede ser utilizado para renombrar un archivo.

```bash
mv old_name new_name
```

### r. `rm`

Elimina un archivo. Si se utiliza este comando en un directorio se producira un error.
`rm: directory: is a directory`
Para eliminar un directorrio, se tiene que incluir la bandera `-r` el cual removera el contenido del directorio de manera recursiva. Se tiene la opcion de incluir la bandera `-f` para forzar el borrado por ejemplo, sin tener que dar una confirmacion.

```bash
rm filename
```

### s. `tail`
Da como salida las ultimas 10 lineas de un archivo. Se puede utilizar la bandera `-f` para agregar datos a la salida a medida que el archivo crece.
  
```bash
tail filename
```

### t. `touch`
Actualiza las marcas de tiempo de acceso y modificacion en el archivo. Si el archivo no existe se crea.


```bash
touch filename
```
Ejemplo:
```bash
$ touch trick.md
```