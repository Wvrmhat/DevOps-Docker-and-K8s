# Building Images

> Working in directory dockerfile-sample-1

```
vim Dockerfile (access the docker file)
exit (ctrl + z to exit)

```

## Building and Editing an image

```
docker image build -t customnginx . (builds a custom image) 
code . (opens file in vs code to edit instead of vim)  
docker image build -t customnginx .  

```

- Added an additional EXPOSE port with 8080. This allows the container to receive packets on that port
- **docker image ls** to view the created image 
- also note that rebuilding images are faster as they have been cached 

It's important to make sure the order of the lines are are the same, things that change the least at top, keeping things that change the most at the bottom of the file.

---

## Extending official images 

We can build on current images such as FROM nginx:latest. We can then run these custom images for testing.
  
```
docker image build -t nginx-with-html .   (while in directory of Dockerfile)
docker container run -p 80:80 --rm nginx-with-html
docker image ls (checks if image is in repo)  
docker image tag nginx-with-html:latest wvrmhat/nginx-with-html:latest    ( used to tag image as latest when pushing to docker hub) 

```