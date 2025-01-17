# Managing multiple containers

## running a nginx, mysql and httpd(apache) server
> 8080:80 means it listens to port 8080 and fowards to port 80

```
docker container run --publish 80:80 --name nginx --detach nginx
docker container run -p 8080:80 --name httpd -d httpd
```
// passes in a random password when running mysql 
docker container run -p 3306:3306 --name mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes -d mysql 

// check if they are running 
docker ps or with docker container ls 

// check container logs on mysql to find random password created at startup
docker container logs mysql
// to specifically get password 
docker logs mysql | grep "GENERATED ROOT PASSWORD"

## cleaning up the containers
docker container ls 
docker container stop <names of containers>
docker container rm <names of containers> 

docker image ls - gives a list of images
