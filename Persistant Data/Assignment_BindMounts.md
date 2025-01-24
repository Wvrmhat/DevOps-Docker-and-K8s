# Assignment: Editing code in containers with Bind Mounts

- Use a Jekyll "Static site generator" to start local web server
- source code is in bindmount=sample-1 
- Edit files with editor on host 
- Container detects changes with host files and updates the web server 
- start container with **docker run -p 80:4000 -4 $(pwd):/site bretfisher/jekyll-serve
- refresh to see browser changes 
- Change file in _post\ and refresh to see changes 

---

Run the following, then in vs code edit the _post file 
```
docker run -p 80:4000 -v "$(pwd)":/site bretfisher/jekyll-serve
```

!(Screenshot202025-01-2420224607.png)
