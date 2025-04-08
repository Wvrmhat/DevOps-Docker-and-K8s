# Kubernetes Architecture: Basic Terms

- Kubernetes is the orchestration system 
 + Also called **K8s** or **Kube**
- Kubectl: The CLI to configure K8s and manage apps
- Node: Similar to swarm, it is a single server in the K8s cluster 
- Kubelet: K8s agent running on nodes 
- Control Plane/Master: is the set of containers that manage the cluster (similar to managers in Swarm) 
 + Includes API server, scheduler, controller manager, etcd

Apps are usually kept to the nodes and K8s management systems to the masters. These all run on top of Docker, or a similar container runtime

---

## Use cases

Assuming we have a multi-server master of odd numbers, the master nodes make the decisions for nodes (workers). All these run on top of docker with a container runtime such as containerd or crio.
Each master has multiple containers, one being **etcd** which acts as a storage system using key values (this is similar to swarm with the RAFT algortithm)
- etcd follows the RAFT protocols, meaning you need odd numbers if you upscale for true fault tolerance
Multiple K8s containers will be run to store data inside etcd and manage the cluster.

-  The API is the way we talker to clusters and issue orders to it 
- The scheduler will control how containers are placed on the nodes in objects called **pods**
- Controller manager looks at the state of the cluster by using the API. Then it takes orders given and runs in a loop to determine what is happening vs what it is asked for.
- Core DNS allows pods and services to communicate with each other within the K8s cluster, it also allows service discovery.

Nodes will need an agent running known as **kubelet**. A kube-proxy is also needed to control the network