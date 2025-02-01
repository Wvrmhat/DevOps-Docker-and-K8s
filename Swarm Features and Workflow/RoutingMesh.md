# Routing Mesh

- Ingress (incoming) network that distributes packets for a Service to proper Task
- Spans all nodes in Swarm
- Uses IPVS from Linux Kernal
- Load balances Swarm Services across their Tasks 
- Works in 2 ways:
	+ Container-to-container in Overlay (uses VIP)
	+ External traffic incoming to published ports (all nodes listen)
	
---

## Using routing mesh

```
docker service create --name search --replicas 3 -p 9200:9200 elasticsearch:2
docker service ps search
curl localhost:9200
```

The Virtual IP acts as a load balancer. Routing mesh is a **stateless** load balancer
- LB is at OSI layer 3 (TCP), not layer 4 (DNS) 
- This does not allow multiple websites to run on the same port on the same swarm 
- To run multiple websites on the same port on the same swarm it is best to use:
 + Nginx or HAProxy LB proxy which are containers to sit in the routing mesh and acts as a **stateful** load balancer which allows cacheing too. 