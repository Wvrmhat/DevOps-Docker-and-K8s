# Adding Image Building to Compose files 

Compose can be used to build custom images, usually used if a build has complex vars or build args such as:

```

services:
  proxy:
    build:
      context: .
      dockerfile: nginx.Dockerfile
    ports:
      - '80:80'
  web:
    image: httpd
    volumes:
      - ./html:/usr/local/apache2/htdocs/

```
In this case the "build" makes use of the Dockerfile to call the image:

```
FROM nginx:1.23

COPY nginx.conf /etc/nginx/conf.d/default.conf

```

---

> Removes custom images that have been saved locally from compose  
```
docker compose down --rmi local
```