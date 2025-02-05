# Full App Lifecycle with Compose 

Compose files can be organized and used to build-up the environment through the SDLC

- local **docker compose up** for dev environment
- remote **docker compose up** for CI environment
- remote **docker stack deploy** for the production environment

For this an override is done, which is the use of a docker file to set the defaults across all environments. The file usually named
"docker-compose.override.yml". Docker compose reads this automatically, and overrides the settings in the docker compose file. 

- docker compose.prod.yml:
	+ Usually we have an external secret for production, this is because we will specify the secret in the command line
	+ Volumes are also specified for specific data 
	
- docker compose.test.yml: 
	+ Has the drupal and postgres (front and backend)
	+ Volumes don't need to be defined as this is only for testing
	+ Usually sample data is used for volumes if it needs to be tested 

> The base config file just defines the two services and their images, but all three compose files relate to the base compose.yml

```
docker compose up -d     ( uses the docker compose file up, then overlays with the override file) 
docker inspect drupal
docker compose down 
```
> For the CI solution, we must be able to do docker compose commands specified with -f. With the order having the base file first. 

```
docker compose -f docker-compose.yml -f docker-compose.test.yml up -d 
docker compose down 
``` 

> The production config is slightly different, instead of compose up we run config. It looks at both files and puts them together into a single compose file. We could also output to another file.

```
docker compose -f docker-compose.yml -f docker-compose.prod.yml config 
docker compose -f docker-compose.yml -f docker-compose.prod.yml config > output.yml  (this file would then be the one officially used in production when creating the stack) 

```



> [!NOTE]
> For this example I am using the "swarm stack 3" file