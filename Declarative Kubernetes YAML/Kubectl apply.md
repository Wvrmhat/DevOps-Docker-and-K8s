# Kubectl apply 

The declaritive way is closer to the DevOps standard, including GitOps. 

```
kubectl apply -f filename.yaml
```
- This command is for updating, editing or changing an image, similar to stack deploy in Swarm 

## Using kubectl apply 

The **-f** works on the whole directory, it allows different resources or objects spread across different files to be pulled in when pointed to a specific directory.

```
kubectl apply -f myyaml/
```

- one yaml file can have multiple resources in it 
- It is also possible to create/update from a URL 

```
kubectl apply -f https://bret.run/pod.yml 
```
Must be careful when pulling down files over the internet, especially when running the file in K8s. This is similar to cURLling something into a shell and allowing it to run 
on the system without looking at the file.

---
