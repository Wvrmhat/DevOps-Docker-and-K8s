# Persistant Data: Bind Mounting

Mapping a host file or directory to container file/directory, two locations pointing to the same files.
Can't use in Dockerfile, must be at container run. 
- Usually host specific
- For example (run -v /Users/wvrmhat/stuff:/path/container  [for linux]), allows anything to map from host to container 
- Allows services running inside container to access files on host 
- Bind Mounts do not require a volume to work 

---


"$(pwd)" is a shell shortcut to print out the working directory instead of typing it out entirely. Use "" when using the command on windows powershell

```
docker container run -d --name nginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx
```
Another container can be made with nginx in another terminal, and we can test whether it mounted to the correct file. Then we can see the docker file because the whole directory was mapped.  

```
docker container run -d --name nginx2 -p 8080:80  nginx
docker container exec -it nginx bash
cd /usr/share/nginx/html
ls -al
```

---

## Working in both terminals 

After having both terminals open, it would be possible to create a new one and see it reflect on the other side

```
touch testme.txt
```

I can then echo a message with the text file 

```
echo "testing text file" > testme.txt   (open localhost/testme.txt) 

```
This allows development environments to be more simpler (without setup on host) as containers can run and be edited on host.

---

In summary bind mounting allows the attachment of an existing directory on host, to a directory inside of a container. 