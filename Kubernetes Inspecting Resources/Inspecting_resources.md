# Inspecting resources with K8s 

Using kubectl get can serve many functions besides simply inspecting the pod.

```
kubectl get deploy/<name of pod> 	(to see the deployed pod) 
```

There are also output options, such as the "wide" output 

```
kubectl get --help 
kubectl get deploy/my-apache -o wide		(this shows the container, image, and selector)
```
- Selectors allow one resource to find its other resources. Usually done with labels and metadata.
 - resources labels are how a parent resource finds it.
 
We can also inspect the resources to a more readable format such as YAML 

```
kubectl get deploy/my-apache -o yaml
```

---

## Inspecting resources with Describe 

kubectl get only works for one resource at a time. Sometimes it is better to get a more comprehensive view of the events or the object, ReplicaSet status etc. 

> kubectl describe gives a smaller amount of info but shows related objects to the resource, as well as events 

```
kubectl describe deploy <name of image>			(shows formatted deployment details including events) 
kubectl describe pod <name of image-xxx-yyyy> 
```

## Inspecting nodes 

Generally these commands are put together to inspect nodes, this workflow consists of high to low level details 
> Inspecting nodes can show details such as cpu usage, and in-depth resource allocation of the node

```
kubectl get node docker-desktop -o wide
kubectl describe node docker-desktop		
```
---

## Watching Resources 

There are commands to view or watch resources in real-time, unlike the get and describe commands. 

- kubectl has the **-w(--watch)** feature built-in

This is used for watching as changes are made. It repeats/loops the line whenever a record is changed. This includes for status changes or if new pods are made 

```
kubectl get pods -w 
kubectl delete pod/<name of pod-xxxx-yyyy> 
```
- It is also possible to watch only new events, and not anything in the past 
- These events are stored in the etcd database 

```
kubectl get events --watch-only
```
These are good for figuring out when pods are misbehaving. 

---

## Kubernetes container logs 

Container logs are not stored in K8s, the API or etcd. They are **stored by default on each node** with the container runtime.

- This is logs of the apps themselves within the containers, not events 

- (get containers logs, picks random replica)
```
kubectl logs deploy/<pod name>    
```
- (used to see if there is any bad behvaiour showing up in the log, starts with latest log line)
```
kubectl logs deploy/<image> --follow --tail 1 		
```
- (gets specific containers logs in a pod) 
```
kubectl logs pod/<podname-xxx-yyy> -c httpd 		
```
- (get logs of all containers in a pod)  
```
kubectl logs pod/<pod name> --all-containers=true 	
```

- (get multiple pod logs with a label search)
```
kubectl logs -l app=<pod name> 						
```

> [!Note]
> [System logs](https://kubernetes.io/docs/concepts/cluster-administration/system-logs/) 
> [logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/)
> [Debug running logs](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/)

