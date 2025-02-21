# Docker Healthchecks

When going into production it is important to do healthchecks. In docker we need the app to exit with a 1 specifically.

- docker engine will exec the command in the container (e.g. curl localhost)
- it expects **exit 0** (OK) or **exit 1** (Error)
- 3 states: starting, healthy, unhealthy 

> This is used to understand whether the container itself has a basic level of healthy, not used for advanced monitoring.

- Healthcheck status shows up as **docker container ls**
- Able to see last 5 healthchecks when inspecting containers 
- Docker run does nothing with Healthchecks
- Services will replace tasks if they fail a healthcheck
- Service updates wait for them before continuing 

## Docker run example 

In the following the elasticsearch imag is used, which is a curl localhost on port 9200. This is the port elasticsearch is running inside the container, not the published port.

- The false statement at the end of "||" is common when using a curl or another tool that sends out error codes besides 1
- This allows us to exit with 1 if there is a problem

```
docker run \ --health-cmd="curl -f localhost:9200/_cluster/health || false " \
--health-interval=5s \
--health-retries=3 \
--health-timeout=2s \
--health-start-period=15s \
elasticsearch:2
```

## Dockerfile example 

The interval is how often the healthcheck runs, timeout is the waiting time before it gives errors out. The start period allows us 
to give longer waiting periods than the first 30s of the duration.

- Options for healthcheck command 

```
--interval=DURATION (default: 30s)
--timeout=DURATION (default: 30s)
--start-period=DURATION (default: 0s) (17.09+)
--retries=N (default: 3)
```

- Format for healthcheck in dockerfile:
```
HEALTHCHECK curl -f http://localhost/ || false 	
```

- Custom options with the same command: 
```
HEALTHCHECK --timeout=2s --interval=3s --retries=3 \ 
CMD curl -f http://localhost/ || exit 1 	 (exit 1 is the same as false)
```

## Healthcheck in Nginx dockerfile 

For a static website running nginx, just need default URL 

```
FROM nginx:1.13 

HEALTHCHECK --timeout=3s --interval=30s \ 
CMD curl -f http://localhost/ || exit 1

```

## Healthcheck in PHP Nginx dockerfile 

PHP-FPM running behind nginx, testing the nginx and fpm status urls 

```
FROM your-nginx-php=fpm-combo-image 

# must forward/ping and /status urls from nginx to php-fpm 

HEALTHCHECK --timeout=3s --interval=5s \ 
CMD curl -f http://localhost/ping || exit 1
```

## Healthcheck in postgres dockerfile 

Using a PostgresSQL utility to test for ready state 

- postgres comes with a built-in tool to check if connections are allowed (pg_isready) 

```
FROM postgres

# must specify user with -U to prevent errors in log

HEALTHCHECK --timeout=3s --interval=5s \ 
CMD pg_isready -U postgres || exit 1
```

## Healthcheck in stack files 

```
healthcheck:
	test:["CMD", "curl", "-f", "http://localhost"]
	interval: 1m30s
	timeout: 10s
	retries: 3
	start_period: 1m  # Version 3.4 minimum 
```



```
docker container run --name p1 -d postgres
docker container run --name p2 -d --health-cmd="pg_isready
docker container inspect p2 		(there is an extra healthcheck variable in p2)
docker service create --name p1 postgres			
```