# Creating 3-Nodes for Swarm 

When creating 3 server instances, we need to initalise with an IP address that is accessible from other servers.

```
docker swarm init --advertise-addr <IP address>  
```

- Then we get a command to add a worker, this should be pasted in the next node.
> Docker playground uses ctrl + insert for copying, and shift + insert for pasting.

```
docker swarm join --token SWMTKN-1-2dec9di0fbvyprmq20f15m0l9dfr8g1076r6roa9yyxvrpfyj6-7c98cmjpejtswpuaxpp2fdwym 192.168.0.23:2377  
```

- Workers cant use swarm commands, therefore in node 1:

```
docker node ls
docker node update --role
docker node update --role manager node2
```

- We can add a node as manager by default, so in node1:
```
docker swarm join-token manager (then copy and paste the token in node3
```
---

## Creating the swarm 

```
docker service create --replicas 3 alpine ping 8.8.8.8
docker service ls
docker node ps
docker node ps node2 
docker service ps <name of service>    (we can see all 3 tasks)
```


> [!NOTE]
> For this example I am using the [play with docker](https://labs.play-with-docker.com) site. An alternative would be setting up Multipass to run multiple VMs.