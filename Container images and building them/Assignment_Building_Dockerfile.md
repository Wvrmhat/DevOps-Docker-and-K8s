# Assignment: Building a Dockerfile and running containers from it 

- Use existing node.js app and dockerize it
- Make Dockerfile. Build it. Test it. Push then run
- Use Alpine version of the official 'node' 6.x image
- Expected result in website at local host 
- Must be tagged and pushed to docker hub
- Remove local image from local cache, then run from docker hub

## In docker file 
```
FROM node:6-alpine

RUN apk add --no-cache tini

EXPOSE 3000

WORKDIR /usr/src/app

COPY package.json package.json

RUN npm install && npm cache clean --force    ( cleans cache only after it is installed) 

COPY . .			( rebuilds if anything is changed in file, acts as a form of cacheing)

CMD ["/sbin/tini", "--", "node", "./bin/www"]     
```

## Building and running the image 

```
docker image build -t custom-node-alpine .
docker container run -p 80:3000 --rm custom-node-alpine
docker container rm -f <container id>
---
docker image tag custom-node-alpine wvrmhat/custom-node-alpine
docker image push wvrmhat/custom-node-alpine
docker image rm -f <id of image> 
docker container run -p 80:3000 --rm wvrmhat/custom-node-alpine:latest
docker container rm -f <container id> 

```