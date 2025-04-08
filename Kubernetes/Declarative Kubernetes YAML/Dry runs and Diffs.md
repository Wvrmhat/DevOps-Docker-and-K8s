# Dry Runs with Apply YAML 

Dry runs can now be used to view what changes are being made, before they are applied. Similar to pushing a commit and comparing changes 

```
kubectl apply -f app.yml --server-dry-run 
```

- This tells whether it has changed or not 

```
kubectl diff -f app.yml 
```
- diff is used to show the comparison of what was removed and added 

---

## Labels and Annotations 

Labels and annotations are a key component to K8s. These go under the metadaya in the YAML. 

- acts as a simple list of key:values for grouping and selecting objects

Common examples include **tier:frontend, app: api, env: prod, customer: acme.co** 

While annotations are for more complex and multi-value data. Usually used when adding custom work into Kubernetes that cant talk and get data out of it.

- Often used for storing different configs which include proxies and ingress

We can also filter pods and only show a specific label 

```
kubectl get pods -l app=nginx 
```

- Where different labels can be filtered, which can be used in apply commands too 

```
kubectl apply -f myfile.yaml -l app=nginx 
```

## Label Selectors 

Services need to know which pods to send traffic to. This is done with label selectors.

- This high level of abstraction, allowing pods to be selected based off each match. Allowing the resources to find their pods. 
- Swarm has a similar feature by default but it cannot be edited 
- Labels and selectors can be used on the nodes to control where they go 

**Taints and Tolerations** are the inverse as it allows us to tell nodes what they can't do, basically controlling where the pods go. 


