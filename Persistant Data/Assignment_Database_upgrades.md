# Assignment: Database Upgrades with Named Volumes

- Database upgrade with containers
- Create postgres container with named volume psql-data using version 15.1
- Use Docker hub to learn VOLUME path and versions needed to run it
- Check logs, stop container 
- Create a new postgres container with same named volume using 15.2
- Check logs to validate 
- (only works with patch versions, most databases require a tool for major/minor versions) 

---

## Creating the postgres container
 
- Creating the first container 
```
docker run -d --name psql1 -e POSTGRES_PASSWORD=mypassword -v psql:/var/lib/postgresql/data postgres:15.1
docker logs psql1
docker stop psql1 
```

- Creating the second container 
```
docker run -d --name psql2 -e POSTGRES_PASSWORD=mypassword -v psql:/var/lib/postgresql/data postgres:15.2
docker logs psql2
docker stop psql2 
```

> VOLUME path of postgres as found on dockerhub 
```
docker run -d -v :/var/lib/postgresql/data 
```

postgres:15.1

postgres:15.2