# Shell vs Exec Forms 

RUN, CMD, and ENTRYPOINT are the only commands that can run a program. Running these programs directly is the exec form, but there is also a shell form.

> Shell form takes whatever comes from dockerfile statement and executes it in the shell such as **RUN apt-get update && apt get upgrate -y**

> Exec form is in a JSON array syntax such as **ENTRYPOINT["startup.sh"]** or **CMD ["python", "server.py"]** 

## General guidelines on when to use shell or exec 

For **RUN** use Shell by default. It is easier to type and works especially for chain commands 

```
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	curl \ 
	&& rm -rf /var/lib/apt/lists/* 
```

```
RUN ["apt-get", "update", "&&", "apt-get", "install", 
"-y", "--no-install-recommends", "curl", "&&", "rm"......
```
Clearly shell is the better option for RUN. 

- For ENTRYPOINT always use Exec, or CMD can't be used 
- For CMD use Exec by default, sometimes Shell form is needed for shell features 
- For ENTRYPOINT + CMD, always use Exec to avoid edge cases 

> The Exec form also ensures it executes directly on PID1, meaning it can receive signals such as SIGINT and doesn't run as a sub-process like Shell Form.
