# Operaciones Basicas

### a. `export`
Despliega todas las variables de ambiente. Si necesitas los detalles de una variable especifica, utiliza `echo $NOMBRE_DE_VARIABLE`.

```bash
export
```
Ejemplo:
```bash
$ export
AWS_HOME=/Users/adnanadnan/.aws
LANG=en_US.UTF-8
LC_CTYPE=en_US.UTF-8
LESS=-R

$ echo $AWS_HOME
/Users/adnanadnan/.aws
```

### b. `whatis`
whatis despliega  la descripcion para los comandos de usuario, llamadas del sistema, funciones de librerias y otros manuales de comandos.

```bash
whatis something
```
Ejemplo:
```bash
$ whatis bash
bash (1)             - GNU Bourne-Again SHell
```

### c. `whereis`
whereis realiza una busqueda de ejecutables, archivos de codigo fuente, manuales de pagina, utilizando una base de datos construida por el sistema de manera automatica.

```bash
whereis name
```
Ejemplo:
```bash
$ whereis php
/usr/bin/php
```

### d. `which`
which realiza una busqueda de ejecutables en los directorios especificados por la variable de ambiente PATH. Este comando despliega las rutas completas a los ejecutables.

```bash
which nombre_del_programa 
```
Ejemplo:
```bash
$ which php
/c/xampp/php/php
```

### e. clear
Limpia el contenido de la ventana.