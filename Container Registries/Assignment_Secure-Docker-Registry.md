# Assignment: Secure Docker Registry with TLS and Auth

To run a registry securely it is important to configure it to serve HTTPS traffic, this can be done by securing it with
a self-signed SSL certificate.

## Generating the SSL certificate

```
mkdir -p certs 
openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
```
- Using "**Docker**" as Org name 
- Using the hostname "**127.0.0.1**" as the common name (CN). Then to get the docker trust cert, we need to copy the domain.crt file

```
mkdir /etc/docker/certs.d
mkdir /etc/docker/certs.d/127.0.0.1:5000 
cp $(pwd)/certs/domain.crt /etc/docker/certs.d/127.0.0.1:5000/ca.crt

```

- Restarting the docker daemon

```
pkill dockerd
dockerd > /dev/null 2>&1 &   (used to avoid output logs from docker daemon)  
```

## Running the registry securely 

The container needs to run with the SSL cert and key files, this is done by using a v mount
to separate the registry data and the certs. The location is also specified of the cert files 
which is done with the -e variable

```
mkdir registry-data
docker run -d -p 5000:5000 --name registry \
  --restart unless-stopped \
  -v $(pwd)/registry-data:/var/lib/registry -v $(pwd)/certs:/certs \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  registry
```

## Accessing the Secure Registry 

An image is then pushed to the secure registry 

```
docker pull hello-world
docker tag hello-world 127.0.0.1:5000/hello-world
docker push 127.0.0.1:5000/hello-world
docker pull 127.0.0.1:5000/hello-world
```

## Adding Basic Auth 

The server uses Apache's htpasswd up to registry:2.6

```
mkdir auth
docker run --entrypoint htpasswd registry:2.6 -Bbn moby gordon > auth/htpasswd
cat auth/htpasswd 	(verifies username and cipher text password) 
```

- entrypoint overwrites the default ENTRYPOINT of the image 
- -B is bcrypt encryption which is required
- -b to run in batch mode 
- -n to display results 

## Running an Authenticated Secure Registry 

```
docker kill registry
docker rm registry
docker run -d -p 5000:5000 --name registry \
  --restart unless-stopped \
  -v registry-data:/var/lib/registry \
  -v certs:/certs \
  -v auth:/auth \		
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -e REGISTRY_AUTH=htpasswd \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  -e "REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd" \
  registry
```
> for windows $(pwd)/ is removed 

- $(pwd)/auth:/auth mounts the local auth folder into the container so registry can access htpasswd file 
- -e htpasswd uses the auth method, then we specify the authentication Realm and the location of the htpasswd file 

## Authenticating with the Registry 

Logging in is needed to push or pull from the registry, similar to logging in with docker hub.
Except it is done with the CN assigned with the localhost name 

```
docker login 127.0.0.1:5000
docker pull 127.0.0.1:5000/hello-world
```
