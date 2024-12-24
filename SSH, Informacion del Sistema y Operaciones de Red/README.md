# SSH, Informacion del Sistema y Operaciones de Red

<table>
   <tr>
      <td><a href="#a-bg">bg</a></td>
      <td><a href="#b-cal">cal</a></td>
      <td><a href="#c-date">date</a></td>
      <td><a href="#d-df">df</a></td>
      <td><a href="#e-dig">dig</a></td>
      <td><a href="#f-du">du</a></td>
      <td><a href="#g-fg">fg</a></td>
      <td><a href="#h-finger">finger</a></td>   
      <td><a href="#i-jobs">jobs</a></td>
      <td><a href="#j-last">last</a></td>
   </tr>
   <tr>
      <td><a href="#k-man">man</a></td>
      <td><a href="#l-passwd">passwd</a></td>
      <td><a href="#m-ping">ping</a></td>
      <td><a href="#n-ps">ps</a></td>
      <td><a href="#o-quota">quota</a></td>
      <td><a href="#p-scp">scp</a></td>
      <td><a href="#q-ssh">ssh</a></td>
      <td><a href="#r-top">top</a></td>
      <td><a href="#s-uname">uname</a></td>
      <td><a href="#t-uptime">uptime</a></td>
   </tr>
   <tr>
      <td><a href="#u-w">w</a></td>
      <td><a href="#v-wget">wget</a></td>
      <td><a href="#w-whoami">whoami</a></td>
      <td><a href="#x-whois">whois</a></td>
   </tr>
</table>

### a. `bg`
Lista trabajos detenidos o en background; reinicia un trabajo en background.
### b. `cal`
Muestra el mes del calendario.

### c. `date`
Muestra la fecha y hora actual.

### d. `df`
Muestra el uso del disco.

### e. `dig`
Obtiene informacion DNS para un dominio.
```bash
dig domain
```

### f. `du`
Muestra el uso del disco de archivos y directorios. Para mas informacion en este comando revisa este [link](http://www.linfo.org/du.html)
```bash
du [option] [filename|directory]
```
Opciones:
- `-h` (legile para humanos) Despliega salida en kilobytes (K), megabytes (M) y gigabytes (G).
- `-s` (suprimir o sumarizar) Despliega el spacio total en disco de un directorio y suprime el reporte para los subdirectorios. 

Ejemplo:
```bash
du -sh pictures
1.4M pictures
```

### g. `fg`
Obtiene el trabajo mas reciente en el foreground.


### h. `finger`
Despliega informacion acerca del usuario.
```bash
finger username
```
### i. `jobs`
Lista los trabajos corriendo en el background, indicando el numero de trabajo.

### j. `last`
Lista los ultimos logins del usuario especificado.
```bash
last yourUsername
```

### k. `man`
Muestra el manual para un comando especificado.
```bash
man command
```

### l. `passwd`
Permite al usuario logueado cambiar su password.
### m. `ping`
Ejecuta un ping a un host y entrega los resultados como salida.
```bash
ping host
```

### n. `ps`
Lista tus procesos.
```bash
ps -u yourusername
```
Utilice las banderas ef, e para mostrar todos los procesos y f para una lista completa.
```bash
ps -ef
```

### o. `quota`
Muestra cual es la cuota de disco.
 
```bash
quota -v
```

### p. `scp`
Transiferer archivos entre un host local y un host remoto o entre dos host remotos.

*copiar de un host local a un host remoto*
```bash
scp source_file user@host:directory/target_file
```
*copiar de un host remoto a un host local*
```bash
scp user@host:directory/source_file target_file
scp -r user@host:directory/source_folder target_folder
```
Este comando tambien acepta la opcion `-P` que se puede utilizar para conectarse a un puerto especifico. 
```bash
scp -P port user@host:directory/source_file target_file
```

### q. `ssh`
ssh (cliente SSH) es un prrograma para iniciar sesion y ejecutar comandos en una maquina remota.
```bash
ssh user@host
```
Este comando tambien acepta la opcion `-P` que se puede utilizar para conectarse a un puerto especifico.  
```bash
ssh -p port user@host
```

### r. `top`
Despliega los procesos activos al momento.

### s. `uname`
Muestra informacion del kernel.
```bash
uname -a
```

### t. `uptime`
Muestra el tiempo que el sistema ha estado arriba.

### u. `w`
Despliega quien esta en linea.

### v. `wget`
Descarga un archivo  
```bash
wget file
```

### w. `whoami`
Regresa el nombre del usuario que tiene la sesion.

### x. `whois`
Obtiene informacion whois para el dominio.
```bash
whois domain
```