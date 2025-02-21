# Docker Registry 

Docker has a prebuilt image for registry, it is part of the docker/distro GitHub repo.  This is used for storing containers privately.

- Does support certificates and basic auth, but are not enabled by default.
- Not role-based access control (RBAC), but instead more like Apache htaccess where user gains full access if you have a username and password
- At its core it is a web API and storage system to handle images
- Basic setup with TLS is recommended to secure the registry 

Since it will be used locally, it is important to keep track of storage space.

> "--registry-mirror" acts as a way to cache hub images inside registry to optimize bandwidth by enabling proxy mode.

---

## Running a private Docker Registry 

The registry is usually run on default port 5000

- Re-tag an existing image and pushing it to new registry 
- Remove the image from local cache and pull it from new registry 
- Re-create registry using a bind mount and see how it stores data 

Docker does not talk to any registry unless it is running HTTPS security, it want to make sure auth is encrypted. This is called
**Secure by Default**

---

In order to use the registry we need to tag it, similar to how we tag images. For the registry it needs to be labelled with the host.

```
docker container run -d -p 5000:5000 --name registry registry
docker container ls
docker run hello-world
docker tag hello-world 127.0.0.1:5000/hello-world
docker image ls
docker push 127.0.0.1:5000/hello-world
```

We can then remove the image sample, and pull it back from the registry 
```
docker image rm hello-world
docker container rm <name of container> 
docker image remove 127.0.0.1:5000/hello-world
docker pull 127.0.0.1:5000/hello-world
```
The image is pulled from the same location. When running our own registries it is important to use a volume to store the data.

- re-creating registry using bind mount to see how it stores data 
```
docker container kill registry 
docker container rm registry 			(removes the registry)
docker container run -d -p 5000:5000 --name registry -v registry-data:/var/lib/registry registry
ll registry-data
docker image ls
docker push 127.0.0.1:5000/hello-world
ll registry-data 
tree			(command that shows multiple SHA directories and layout of files)				
```
---

