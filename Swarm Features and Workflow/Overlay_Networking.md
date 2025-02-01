# Overlay Networking 

Acts as a bridge network for Swarm where containers can access each other similar to being on a VLAN.
- Use **--driver overlay** when creating the network
- For container-to-container traffic inside a single Swarm
- Optional IPSEC (AES) encryption when creating the network
- A service can be cconnected to multiple networks 
- No need to manually install a load balancer to distribute incoming network traffic  
---

When creating the services on node1, they automatically assign or partition themselves among node2 and 3.
- Therefore the database talks across nodes
- Acts as if everything is on the same subnet
- Can use any of the 3 IP addr to access the drupal site

```
docker network create --driver overlay mydrupal
docker network ls
docker service create --name psql --network mydrupal -e POSTGRES_PASSWORD=mypass postgres
docker service ls 
docker service logs psql
docker service create --name drupal --network mydrupal -p 80:80 drupal
docker service ps drupal
docker service inspect drupal
```