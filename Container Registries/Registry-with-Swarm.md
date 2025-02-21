# Docker Registry with Swarm 

We can run registry by creating it as a service in swarm

```
docker service create --name registry -p 5000:5000 registry
docker service ps registry
docker pull hello-world
docker tag hello-world 127.0.0.1:5000/hello-world
docker push 127.0.0.1:5000/hello-world
```
This gets pushed to a repo, which can be added to and acts as an array. Meaning we can add more services to the registry such as nginx

```
docker pull nginx
docker push 127.0.0.1:5000/nginx
docker service create --name nginx -p 80:80 --replicas 5 --detach=false 127.0.0.1:5000/nginx
docker service ps nginx 
```
- A swarm has to be able to pull images on all nodes from a repo in a registry that all can reach.
- Since the registry was ran as a service, all nodes can access it, the routing mesh then determines the correct container
- Using a hosted SaaS registry is preferred especially if they are open-source
- Making your own registry is usually needed if there is an offline requirement 

---

