# Resource Generators 

Commands often have generators behind them that has a template with the necessary defaults. These generators is to make it easier
to use **one-line** commands similar to Docker Compose and Swarm.

```
kubectl create deployment sample --image nginx --dry-run=client -o YAML
```
- the **--dry-run** shows the output of what was typed, which will be outputted to a YAML file 
- Generators are usually 15-20 lines of code

## Generator examples 

```
kubectl create deployment test --image nginx --dry-run=client -o yaml 
```

- The kind: deployment shows that we created a deployment, it also shows the labels and name attributes, name of app 
- There is a nested layer of spec for deployment which shows the replicas, and name of container image 

```
kubectl create job test --image nginx --dry-run=client -o yaml 
```  
- jobs are usually used when creating a set of pods to run only once. 
- by default jobs have no restart policy 

```
kubectl create deployment test --image nginx   (deployment needed first) 
kubectl expose deployment/test --port 80 --dry-run=client -o yaml 
```
- In this case we need a deployment first to dry run an exposed test 
- The "kind: " is a service now instead of job or deployment 
- The spec is also all about ports and protocols since it is a service

```
kubectl delete deployment test (when done running) 
```

---


