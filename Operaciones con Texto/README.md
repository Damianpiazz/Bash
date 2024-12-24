## 1.2. Text Operations

<table>
    <tr>
      <td><a href="#a-awk">awk</a></td>
      <td><a href="#b-cut">cut</a></td>
      <td><a href="#c-echo">echo</a></td>
      <td><a href="#d-egrep">egrep</a></td>
      <td><a href="#e-fgrep">fgrep</a></td>
      <td><a href="#f-fmt">fmt</a></td>
      <td><a href="#g-grep">grep</a></td>
      <td><a href="#h-nl">nl</a></td>
      <td><a href="#i-sed">sed</a></td>
      <td><a href="#j-sort">sort</a></td>
   </tr>
   <tr>
      <td><a href="#k-tr">tr</a></td>
      <td><a href="#l-uniq">uniq</a></td>
      <td><a href="#m-wc">wc</a></td>
   </tr>
</table>

### a. `awk`
awk es el comando mas util para manejar archivos de texto. Opera en un archivo completo linea por linea. Por defecto utiliza el espacio en blanco para separar los campos. La sintaxis mas comun para el comando awk es 


```bash
awk '/search_pattern/ { action_to_take_if_pattern_matches; }' file_to_parse
```
Tomemos el siguiente archivo `/etc/passwd`. A continuacion se muestran los datos de ejemplo que contiene este archivo:
```
root:x:0:0:root:/root:/usr/bin/zsh
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
```
Ahora tomemos solo los nombres de usuario del archivo. Donde `-F` especifica con base en que se separaran los campos. En este caso sera `:`. `{ print $1 }` indica imprimirr de salida el primer campo que coincida.

```bash
awk -F':' '{ print $1 }' /etc/passwd
```
Despues de ejecutar el comando anterior  se tendra la siguiente salida.
```
root
daemon
bin
sys
sync
```
Para mas detalles en como utilizar `awk`, revisa el siguiente [link](https://www.cyberciti.biz/faq/bash-scripting-using-awk).
### b. `cut`
Elimina secciones de cada linea de los archivos
*Ejemplo.txt*
```bash
red riding hood went to the park to play
```
*muestra me las columnas 2, 7 , y 9 con un espacio en blanco como separador*
```bash
cut -d " " -f2,7,9 Ejemplo.txt
```
```bash
riding park play
```

### c. `echo`
Despliega una linea de texto


*despliega "hola mundo"*
```bash
echo hola mundo
```
```bash
hola mundo
```

*despliega "hola mundo" con lineas nuevas entre palabras*
```bash
echo -ne "Hello\nWorld\n"
```
```bash
Hello
World
```

### d. `egrep`
Imprime las lineas que corresponda a un patron - Expresion extendida (alias para: 'grep -E')


*Ejemplo.txt*
```bash
Lorem ipsum
dolor sit amet, 
consetetur
sadipscing elitr,
sed diam nonumy
eirmod tempor
invidunt ut labore
et dolore magna
aliquyam erat, sed
diam voluptua. At
vero eos et
accusam et justo
duo dolores et ea
rebum. Stet clita
kasd gubergren,
no sea takimata
sanctus est Lorem
ipsum dolor sit
amet.
```
*Despliega lineas que contengan "Lorem" o "dolor" en ellas.*
```bash
egrep '(Lorem|dolor)' Ejemplo.txt
or
grep -E '(Lorem|dolor)' Ejemplo.txt
```
```bash
Lorem ipsum
dolor sit amet,
et dolore magna
duo dolores et ea
sanctus est Lorem
ipsum dolor sit
```

### e. `fgrep`
Imprime lineas que correspondan a un patron - Correspondencia de patron FIJO (alias for: 'grep -F')

*Ejemplo.txt*
```bash
Lorem ipsum
dolor sit amet,
consetetur
sadipscing elitr,
sed diam nonumy
eirmod tempor
foo (Lorem|dolor) 
invidunt ut labore
et dolore magna
aliquyam erat, sed
diam voluptua. At
vero eos et
accusam et justo
duo dolores et ea
rebum. Stet clita
kasd gubergren,
no sea takimata
sanctus est Lorem
ipsum dolor sit
amet.
```

*Encuentra la cadena exacta '(Lorem|dolor)' en Ejemplo.txt*
```bash
fgrep '(Lorem|dolor)' Ejemplo.txt
or
grep -F '(Lorem|dolor)' Ejemplo.txt
```
```bash
foo (Lorem|dolor) 
```

### f. `fmt`
Formateador de texto simple y optimizado

*Ejemplo: Ejemplo.txt (1 linea)*
```bash
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
```
*Entrega lineas de  Ejemplo.txt hasta 20 caracteres en total*
```bash
cat Ejemplo.txt | fmt -w 20
```
```bash
Lorem ipsum
dolor sit amet,
consetetur
sadipscing elitr,
sed diam nonumy
eirmod tempor
invidunt ut labore
et dolore magna
aliquyam erat, sed
diam voluptua. At
vero eos et
accusam et justo
duo dolores et ea
rebum. Stet clita
kasd gubergren,
no sea takimata
sanctus est Lorem
ipsum dolor sit
amet.
```

### g. `grep`
Busca texto dentro de los archivos. Se puede utilizar grep para buscar lineas de texto que correspondan una o varias expresiones regulares y entrega como salida solo las lineas que corresponda.

```bash
grep pattern filename
```
Ejemplo:
```bash
$ grep admin /etc/passwd
_kadmin_admin:*:218:-2:Kerberos Admin Service:/var/empty:/usr/bin/false
_kadmin_changepw:*:219:-2:Kerberos Change Password Service:/var/empty:/usr/bin/false
_krb_kadmin:*:231:-2:Open Directory Kerberos Admin Service:/var/empty:/usr/bin/false
```
Tambien se puede forzar grep para que ignore mayusculas utilizando `-i`. `-r` puede ser utilizado para buscar todos los archivos en un directorio especificado, por ejemplo:
```bash
$ grep -r admin /etc/
```
Y `-w` se puede utilizar para buscar solo palabras. Para mas detalles de `grep` revisa el siguiente  [link](https://www.cyberciti.biz/faq/grep-in-bash).


### h. `nl`
Numero de lineas en archivos
*Ejemplo.txt*
```bash
Lorem ipsum
dolor sit amet,
consetetur
sadipscing elitr,
sed diam nonumy
eirmod tempor
invidunt ut labore
et dolore magna
aliquyam erat, sed
diam voluptua. At
vero eos et
accusam et justo
duo dolores et ea
rebum. Stet clita
kasd gubergren,
no sea takimata
sanctus est Lorem
ipsum dolor sit
amet.
```

*show Ejemplo.txt with line numbers*
```bash
nl -s". " Ejemplo.txt 
```
```bash
     1. Lorem ipsum
     2. dolor sit amet,
     3. consetetur
     4. sadipscing elitr,
     5. sed diam nonumy
     6. eirmod tempor
     7. invidunt ut labore
     8. et dolore magna
     9. aliquyam erat, sed
    10. diam voluptua. At
    11. vero eos et
    12. accusam et justo
    13. duo dolores et ea
    14. rebum. Stet clita
    15. kasd gubergren,
    16. no sea takimata
    17. sanctus est Lorem
    18. ipsum dolor sit
    19. amet.
```

### i. `sed`
Stream editor for filtering and transforming text

*Ejemplo.txt*
```bash
Hello This is a Test 1 2 3 4
``` 
*reemplaza todos los espacios con guiones*
```bash
sed 's/ /-/g' Ejemplo.txt
```
```bash
Hello-This-is-a-Test-1-2-3-4
```
*reemplaza todos los digitos con "d"*
```bash
sed 's/[0-9]/d/g' Ejemplo.txt
```
```bash
Hello This is a Test d d d d
```

### j. `sort`

Ordena lineas de archivos de texto

*Ejemplo.txt*
```bash
f
b
c
g
a
e
d
```

*Ordenar Ejemplo.txt*
```bash
sort Ejemplo.txt
```
```bash
a
b
c
d
e
f
g
```

*Ordena de manera aleatorio un archivo ordenadoEjemplo.txt*
```bash
sort Ejemplo.txt | sort -R
```
```bash
b
f
a
c
d
g
e
```

### k. `tr`
Reemplaza o elimina caracteres.

*Ejemplo.txt*
```bash
hola mundo Foo Bar Baz!
```
*toma todas las letras minusculas y las convierte en mayusculas *
```bash
cat Ejemplo.txt | tr 'a-z' 'A-Z' 
```
```bash
hola mundo FOO BAR BAZ!
```
*toma todos los espacios y los convierte en saltos de linea*
```bash
cat Ejemplo.txt | tr ' ' '\n'
```
```bash
Hello
World
Foo
Bar
Baz!
```

### l. `uniq`
Reporta o omite lineas repetidas

*Ejemplo.txt*
```bash
a
a
b
a
b
c
d
c
```

*muestra solo lineas unicas de Ejemplo.txt (primero necesitas ordenarlo, de otra manera no vera las coincidencias)*
```bash
sort Ejemplo.txt | uniq
```
```bash
a
b
c
d
```

*muestra los items unicos de cada linea y muestrar cuantas instancias encontro*
```bash
sort Ejemplo.txt | uniq -c
```
```bash
    3 a
    2 b
    2 c
    1 d
```

### m. `wc`
Obtiene cuantas lineas, palabras y caracteres hay en un archivo.
```bash
wc filename
```
Ejemplo:
```bash
$ wc demo.txt
7459   15915  398400 demo.txt
```
Donde `7459` son lineas, `15915` son palabras y `398400` son caracteres.

## 1.3. Operaciones con Directorios

<table>
   <tr>
      <td><a href="#a-cd">cd</a></td>
      <td><a href="#b-mkdir">mkdir</a></td>
      <td><a href="#c-pwd">pwd</a></td>
   </tr>
</table>

### a. `cd`
Te mueve de un directorio a otro, ejecutando lo siguiente
```bash
$ cd
```
te mueve al directorio home. Este comando acepta de manera opcional `dirname`, el cual te mueve a ese directorio.
```bash
cd dirname
```

### b. `mkdir`
Crea un nuevo directorio.  
```bash
mkdir dirname
```
Puedes utilizar este comando para crear multiples directorios al mismo tiempo en el directorio actual.
```bash
mkdir 1stDirectory 2ndDirectory 3rdDirectory
```
Tambien puedes utilizarlo para crear directorios padre al mismo tiempo. Por ejemplo, si quieres un directorio llamada 'project1' en otro subdirectorio como '/samples/bash/projects/', puedes ejecutar:

```bash 
mkdir /samples/bash/projects/project1
```
Si alguno de estos directorios no existe, se crearan tambien.
### c. `pwd`
Te indica en que directorio te encuentras.
```bash
pwd
```