# Startup script for webapp

This assignment has me building a Dockerfile from scratch to perform startup tasks with an ENTRYPOINT script. 
This script will perform a few actions before starting the FastAPI Python web API server.

- Once this image builds, you can run it with a -p 8000:8000 to make the web server available on http://localhost:8000
- The most interesting URL for testing is the built-in docs of FastAPI at http://localhost:8000/docs

```
docker build -t fastapi .
docker run -p 8000:8000 fastapi
```
