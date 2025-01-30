# Assignment: Writing Compose File

- Build basic compose file for Drupal contant management system website
- Use drupal image along with postgres image
- Use ports to expose Drupal on 8080 so you can localhost:8080
- Set a POSTGRES_PASSWORD for postgres
- Walk through Drupal setup via browser
- Drupal assumes DB is localhost, but it is service name 
- (optional): use volumes to store drupal unique data

---

```
name: compose_assignment

services:
  drupal-service:
      image: drupal:9
      ports:
        - "8080:80"

      volumes:
        - drupal-modules:/var/www/html/modules
        - drupal-profiles:/var/www/html/profiles
        - drupal-themes:/var/www/html/themes
        - drupal-sites:/var/www/html/sites

  postgres-service:
    image: postgres:14

    environment:
      - POSTGRES_PASSWORD=password

volumes:
  drupal-modules:
  drupal-profiles:
  drupal-themes:
  drupal-sites: 
```

After configuring the yml, run **docker compose up**, then **docker compose down -v** when done. The following is the result of running the docker compose.yml file  