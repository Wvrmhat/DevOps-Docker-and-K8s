# Stacks: Production Grade Compose

A layer of abstraction for Swarm called Stacks. Stacks allow Compose filles to be used for services, network, secrets and volumes

> "docker stack deploy" - instead of "docker service create"

Stacks manages the objects for us, so no need to first create networks or volumes but we still can still create them.

> We use External in Compose file, this is used in Swarm to create the networks/volumes 

New "deploy": key in Compose file. Allows us to specify what we need for Swarm, but we cant do a build since it shouldn't happen in Swarm. Compose ignores deploy information, while Swarm ignores build.

- docker compose cli not needed on Swarm server as it is not a production tool, it is meant for dev and sys admin helper tool. 

---

## Running a Stack 

```
docker stack deploy -c <name of the file.yml> <name of the app> 
docker stack ls 
docker stack ps <name of app>
docker stack services <name of app> 	(its similar to docker services ls) 

```
- -c meaning compose 
- When updating the stack, we run the same command since we are deploying to the same stack. It updates automatically


