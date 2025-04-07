# ENTRYPOINT 

Entrypoint executes a command on container start similar to CMD

- ENTRYPOINT is a Runtime statement, stored as metadata with an image 
- Only the **last** ENTRYPOINT in a Dockerfile is used, making it also an **Overwrite** type

> Containers need either a CMD or ENTRYPOINT to know how to start. 

- Entrypoint requires more typing to overwrite compared to CMD, so it is rarely used as a replacement for CMD

Entrypoints can be overwritten with the --entrypoint command 
```
docker run --entrypoint "hostname" <image> 
```

---

## Entrypoint and CMD 

Entrypoint + CMD are often used together for running containers as CLI tools. Another use case is for running startup scripts before the main program starts.

```
ENTRYPOINT ["curl"]

CMD ["--help"]

```
Allows us to keep run command short, while adding flexibility. 

> Running a shell script in the cmd won't work as an alternative because it causes the main app to run as a subprocess. Shutdown signals such as SIGTERM and SIGINIT 
won't be avaiable to shutdown the container gracefully, in some cases docker is forced to kill the app leaving data corrupted due to this.

- The fix for this is to run the script first then pass execution with exec "$@" at the end of the script 

It is also possible to overwrite the CMD at runtime without having the daemon run. For example running MySQL with the sh shell.

- We can therfore open a shell inside MySQL. While in the shell a "ls /bin" command can be run to view the MySQL tools in there. 

```
docker run --name myshell -it mysql sh 
``` 
- Running a docker top will show us the processes running inside the myshell container, in this case the only process running is the shell.  

```
docker top myshell 
```

### Key takeaways

- If ENTRYPOINT and CMD are set, they combine into a single command for the starting container 
- Use entrypoint to set the base executable for CLI tools, while CMD will provide the default arguements
- For pre-launch scripts, ENTRYPOINT should set the script and CMD will set the final process 
- ENTRYPOINT shell scripts use **exec "$@"** to pass executoin to (PID 1) to the CMD   








