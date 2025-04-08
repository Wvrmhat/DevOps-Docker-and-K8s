# K8s Container Abstractions 

- **Pod**: Basic unit of deployment, consists of containers running together on a node
- **Controllers**: Controls pods, which continually validates whether or not whats going on inside of K8s is what you asked it to do. (is a differencing engine with different types)
  - types: Deployment, ReplicaSet, StatefulSet, DaemonSet, Job, CronJob etc. 
- **Service**: Is the endpoint given to a set of pods after using a controller, is a persistant endpoint in a cluster 
- **Namespace**: Optional feature to filter groups of objects in a cluster. 

> [!Note]
> For additional reading on: [Pods](https://kubernetes.io/docs/concepts/workloads/pods/), [Service](https://kubernetes.io/docs/concepts/services-networking/service/), and [Namespaces](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/)
