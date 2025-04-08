# Storage in Kubernetes 

StatefulSets allow storage resources to be more sensitive to persistant data. Orchestrator usually invovles stateless storage, which generally don't involve databases.
- Ideally best to use a cloud based form of storage, since databases and persistant storage is more detailed and harder to work with. 

Volume statements can be added inside "spec:". With kubernetes it is controlled at the container volume, but it works inside the pod.
There are also **claims** which allow multiple pods to share persistant volumes which are made outside the pod.

- Third-party storage was added in tree, and added within the binaries of Kubernetes. Storage vendors such as Amazon and Azure added this.
- Container Storage Interface (CSI) is a standard that allows storage vendors to provide plugins. 

---

# Ingress 

Service types don't work at OSI layer 7(HTTP). Ingress is a specific resource that is focused on the problem of most clusters that run on many websites. 

- Ingress Controllers is not installed by default, they provide mechanisms for 3rd party proxies to access the container.
- Usually used when needing different websites to run on the same containers.

Ingress controllers help provide routing methods for websites that need to run off multiple containers, this helps application devs working with the DevOps team to indicate what is needed such as ports, SSL, certificates etc.

---

# CRD's and The Operator Pattern 

3rd party resources allow the Kubernetes API to be extended and modified. The operator pattern allows custom resources and controllers to be used in K8s. 

- Allows complex software to be used in Kubernetes that required monitoring.
- The custom code allows Kubectl commands to operate the tools as if they were natively part of Kubernetes itself. 
- Consists of complex YAML files that gets commands from other APIs to extend K8s. 
- The **Operator** therefore automates deployment and management. 

---

# Higher Deployment Abstractions 

There are many opinions on how apps should be deployed, with **Helm** being one of the more popular ways to build templates and deploy.
- **Compose on Kubernetes** is another way to deploy or "translate" the YAML of compose into the YAML of Kubernetes format.
- As teams grow larger, some clusters may have Helm, while developers end up with Compose on Kubernetes. 
- Most distros support Helm, it is also harder to avoid in larger environments. 

## Templating YAML

Most of these tools help template YAML files. Kubernetes now has a **Kustomize** feature that allows you to do similar things to Helm and other deployment solutions.

- Kustomize is not as powerful, but it is the official feature of K8s.
- Allows other tools to be run on top of it with an override 
- Docker app does its own templating of Compose YAML, which is a similar option to Kustomize. 
- Compose YAML extracts things like environment variables which can then be packed into a single image, allowing YAML to be versioned when deploying.

---

# Namespaces and Context 

Namespaces are virtual views inside a single cluster. Filters view of the command and allows control of networking. Unrelated to Docker namespaces.

- namespaces are set with a context to get different views. 

```
kubectl get namespaces 
kubectl get --all-namespaces 
```

There are 3 parts of a context: Cluster, Authentication/User, Namespace. This is defined by default in **~/.kube/config**/. This should be kept private as it contains auth information. 

```
kubectl config get-contexts 
```
- This shows a list of the different context in a more clean format.
- There are also set options to set the default for different contexts 

```
kubectl config set*
```

---




 
