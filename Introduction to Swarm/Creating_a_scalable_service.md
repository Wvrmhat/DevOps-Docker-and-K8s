# Creating a service and scaling it locally

Firstly to initialise swarm we use:

```
docker swarm init 
```
This command also creates the "Raft consensus database" which stores root CA, configs and secrets.
- Encrypted by default on disk
- No key/value system to hold orchestration/secrets
- Replicates logs amongst manages via mutual TLS in "control Plane" 

---

## Nodes commands 

For managing nodes or promoting workers to leaders etc. 

```
docker node ls
docker node --help
```

## Swarm commands

To initialise, join or leave 

```
docker swarm --help 
```

## Docker Service commands

Similar to docker run, except it works in swarm mode. We create services similarly to containers.

```
docker service create alpine ping 8.8.8.8
docker service ls 						(brings up a list of running services) 
docker service ps <name of service> 	(shows tasks or containers for the service ) 
```
- We can also upscale our services with the following

```
docker service update <ID or name of service> --replicas 3
docker service ls
docker service ps <name of service>		(Now we can see 3 tasks running)
docker service update --help 
```

> If a container is forcefully removed, swarm is responible for recovering a new container to replace it. Therefore it recreates containers when they go down or fail

```
docker service rm <name of service/ID> 
```



