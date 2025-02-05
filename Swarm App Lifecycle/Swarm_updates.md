# Service Updates 

- Rolling replacement of tasks/containers in a service, updates each container by replacing it with new settings.
- Limits downtime, each app that has a service will impact the other things around it differently (such as a database) during an updates
- Databases or anything that requires a persistant connection is harder to update so it needs to be tested
- Containers are replaced for most changes
- Create options will usually change, adding -addd or -rm to them 
- Includes rollback and healthcheck options 
	+ docker service rollback web and docker service scale web=4 
- Stack deploy, when pre-existing, will issue service updates automatically 

## Swarm Update Examples 

- Update image to a newer version 
 + **docker service update --image myapp:1.2.1 <servicename>**
 
- Adding an env variable and removing a port 
 + **docker service update --env-add NODE_ENV=production --publish-rm 8080 **
 
- Changing number of replicas of two services 
 + **docker service scale web=8 api=6**
 
## Swarm Updates in Stacks 

Works with other parts of the API to determine if there's any changes needed 

- Same command, just have to edit the YAML file
 + **docker stack deploy -c file.yml <stackname>
 
---



```
docker service create --name web -p 8080:80 nginx:1.13.8
docker service ls 

```
 
- To scale up the service and do a rolling image 

```
docker service scale web=5 
docker service update --image nginx:1.13.6 web 
```
 
- Then we can also change the published port 

```
docker service update --publish-rm 8088 --publish-add 9090:80
```

- When changing the number of nodes, a lot of things move around and it becomes uneven. This is where rebalancing is needed 
 + An update can then be forced of a service without changing anything in that service (tasks are reissued where the least used nodes are picked)
 ```
 docker service update --force web 
 ```
 
- Cleaning up services 
 
```
docker service rm web 
```