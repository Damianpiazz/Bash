## Operaciones de Monitoreo de Procesos

<table>
   <tr>
      <td><a href="#a-kill">kill</a></td>
      <td><a href="#b-killall">killall</a></td>
      <td><a href="#c-&">&amp;</a></td>
      <td><a href="#d-nohup">nohup</a></td>
   </tr>
</table>

### a. `kill`
Elimina (termina) los procesos con el ID proporcionado.
```bash
kill PID
```

### b. `killall`
Elimina todos los procesos con el nombre proporcionado
```bash
killall processname
```

### c. &
El simbolo `&` le indica al comando que se ejcuta como un proceso en background en una subshell.
```bash
command &
```

### d. `nohup`
nohup significa "No hang up" (No colgar). Esto permite ejecutarr comandos/procesos o shell scripts para que pueda continuar corriendo en background aun cuando se sale de una shell.
```bash
nohup command
```
Combinalo con `&` para crear un proceso en background.
```bash
nohup command &
```