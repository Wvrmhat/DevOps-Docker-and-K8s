# Persistant Data: Data Volumes

To make reading easier, it is best to name volumes (-v) 

```
docker container run -d --name mysql_test -e MYSQL_ALLOW_EMPTY_PASSWORD=True -v mysql-db:/var/lib/mysql mysql

```
In this case the container was named with mysql-db, in the folder /var/lib/mysql .

---
Some cases would need a volume created before the container itself. This would be for specifying differing drivers, or driver options. Usually done before a docker run.

```
docker volume create --help
```

## Inspecting volumes 

A volume stores the data locally at a certain location even after the container has been removed 

```
docker volume ls
docker volume inspect <volume name>
```