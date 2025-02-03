# Swarm Secrets Storage

Easier solution for storing secrets in swarm. 
- A secret consists of:
	+ Usernames and passwords
	+ TLS certificates and keys
	+ SSH keys
	+ Any data that is meant to be encrypted 
	
- Supports generic strings or binary content up to 500kb in size
- Does not require apps to be rewritten

Swarm Raft DB is encrypted on disk, which is only stored on Manager nodes. Default is Managers and Workers "Control Plane" TLS + Mutual AUTH
> First stored in Swarm, then assigned to Services

Stored in memory only, using a ram fs system. We can set up aliases 
Local docker compose can use file-based secrets, but its not secure as it fakes security 

- Secrets is a Swarm only thing, docker compose can however mount secrets in a local container. Though it only works locally as it is not used in production 

---

# Using Secrets in Swarm Services 

```
docker secret create <name of secret> <name of file.txt>
```

Echo in from the command line with the password. The "-" tells it to read from standard input which we give with the echo command.
```
echo "myDBpassWORD" | docker secret create psql_pass -
```
> this is bad as it stores the password on the hardrive of the server, of the host. If someone gets into root, they can get the password out

After creating secrets, we can map them to services when we create them.

```
docker service create --name psql --secret psql_user (name of secret) --secret psql_pass (name of secret) -e POSTGRES_PASSWORD_FILE=/run/secrets/psql_pass -e POSTGRES_USER_FILE=/run/scecrets/psql_user postgres
```
> for the above a secret is used for the user and password, so two secrets and two environment file vars were made   

```
docker service ps <name of service>
docker exec -it <name of container> bash 
ls /run/secrets/ 		(to see the file)
cat /run/secrets/psql_user 
docker log <name of container> 
```

## To remove the secret 

- When we remove secrets, the container has to redeploy to make the changes.

```
docker service update --secret-rm
```

---

# Using secrets in Swarm Stacks 

To do secrets in a compose file, we either use a file for each secret or have them pre-created. We also need to tell the Compose file where the secrets are as we assign them to the services that need them.

```
docker stack deploy -c docker-compose.yml mydb  (name of compose file and name of stack)
docker secret ls 
docker stack rm mydb  		(to remove secret)
```
- Usually in a productive environment it is best not to keep the secret locally, it is best to cleanup the residual secrets on the machine.

