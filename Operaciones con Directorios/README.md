## Operaciones con Directorios

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