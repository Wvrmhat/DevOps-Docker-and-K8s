# Creating a Multi-Service App

- Use docker's Distributed Voting App
- Use swarm-app 1 directory in repo
- 1 Volume, 2 networks, and 5 services needed
- Create comands needed, spin up services and test app
- No data needed on Swarm, everything is using docker hub images

## Creating the networks 

```
docker swarm init
docker network create --driver overlay backend
docker network create --driver overlay frontend
```

## Creating the services 

```
docker service create --name vote --network frontend -p 80:80 --replicas 2 bretfisher/examplevotingapp_vote
docker service create --name redis --network frontend --replicas 1 redis:3.2
docker service create --name worker --network frontend --network backend --replicas 1 bretfisher/examplevotingapp_worker
docker service create --name db --network backend --mount type=volume,source=db-data,target=/var/lib/postgresql/data -e POSTGRES_HOST_AUTH_METHOD=trust postgres:9.4
docker service create --name result --network backend -p 5001:80 --replicas 1 bretfisher/examplevotingapp_result
```

## Checking services

```
docker service ls 
docker service ps <name of service> 
```


> [!NOTE]
> For this example I am using the [play with docker](https://labs.play-with-docker.com) site. An alternative would be setting up Multipass to run multiple VMs.