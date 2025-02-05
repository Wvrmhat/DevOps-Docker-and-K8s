# Using Secrets locally 

This is used during the testing and development process 

```
docker compose up -d 	
docker compose exec psql cat /run/secrets/psql_user 
```
- This bindmounts at runtime the file from hardrive into the container (similar to using a -v)
- Its not secure but allows us to develop with same process and secret, except its done locally
- This only works with file secrets and not external
- Meaning we can match our production environment locally 


> [!NOTE]
> For this example I am using the "secrets sample 2" file