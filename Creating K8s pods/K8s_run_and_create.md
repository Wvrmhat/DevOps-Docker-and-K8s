# Kubernetes Run, Create, and Apply 

3 Ways to create pods from the kubectl CLI

- kubectl run (single pod per command, similar to docker run) 
- kubectl create (creates resources through CLI or YAML, similar to docker create)
- kubectl apply (create/update anything via YAML) 

---

## Creating pods with kubectl run 

We always have to give a name when creating pods and specifying the image. Also we are not exactly running the container, it just means K8s API has received the request and stored the 
entry in its database, etcd. 

```
kubectl version
kubectl run my-nginx --image nginx
kubectl get pods
kubectl get all			( lists pod and kubernetes service) 
```
Pods is a Kubernetes concept, it is a layer of abstraction and not a real thing. It is the idea of a resource type that wraps around one or more containers which all share the same
IP address. Kubernetes can really only deploy pods unlike containers which Docker uses.

- Kubernetes tells the **container runtime** to create the container for that pod, by using **kubelet** (also known as the node agent) 
- Therefore kubelet tells container runtime to create containers 
- Every resource type to run/create containers uses Pods, **Kubernetes never directly creates containers**. Kubernetes only creates pods. 

A request for a pod is sent to the control plane. The API will receive the request and store it as a pod request in the database. The scheduler then assigns it to a node, and the 
kubelet agent, with a persistant connection to the API, will see the pod request and then take it. Then it will determine how many containers to create 

---

## Deployment with kubectl create 

Deployment allows all the features for enterprise use, production and rolling updates

```
kubectl create deployment my-nginx --image nginx 
```

Pod is changed to deployment, this just means the resource type was changed when requesting it. However in the control plane, deployment uses the API to store it in the etcd.
The controller manager looks at different resource types, and sees the deployment resource when looking at the API. It then controls the deployment resources, while the Deployment
resource does one thing. **Deployment resource creates the ReplicaSet** 

- When doing rolling updates, blue-green, or Canary-type deployments. A new version can be deployed while the older one is still running.
- Deployment creates a **ReplicaSet** for each new deployment type. (replica sets are created when image versions are changed)
- Two ReplicaSets will have two different pod specs, one being he old version and one being the new image name or tag in the new ReplicaSet
- Therefore **ReplicaSets acts as a version for each deployment** 

The scheduler would notice that the pods are not scheduled to a node, once it has then it is assigned to the kubelet. The kubelet then knows where to find the record through the API.

---

## Cleanup 

```
kubectl delete pod <pod name>
kubectl delete deployment <pod name> 
```
