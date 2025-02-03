# Assignment: Creating a Stack with Secrets

- Use Drupal compose file from compose-assignment-2 
- Rename image to official drupal:8.2
- Remove **build:**
- Add secret with **external:**
- Use environment variable POSTGRES_PASSWORD_FILE
- add secret via cli **echo "<pw>" | docker secret create psql-pw -**
- Copy compose into new yml file on Swarm node1

```
echo "234jhidsfho389" | docker secret create mariadb-pw -   (create the secret before deploying the stack) 
docker stack deploy -c docker-compose.yml drupal
docker stack ps drupal
```
