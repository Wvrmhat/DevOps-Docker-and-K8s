# Scaling ReplicaSets

We scale up when we want to make our pods more scalable, fault tolerant and more available. 

```
kubectl create deployment my-apache --image httpd

(These two commands are the same, they are just different ways of writing them) 
kubectl scale deploy my-apache --replicas 2
kubectl scale deploy/my-apache --replicas 2
```
When we set replicas, we are setting our desired state. Meaning our final state should be state in this example

- config manager will only see the replica count has changed
- pod spec is not changed, only a replica is added to the deploy spec
- scheduler will see the new pod, find the resources and assign a node to that pod 
- kubelet will see the pod, and tell the container runtime to start the apache (httpd) image 
