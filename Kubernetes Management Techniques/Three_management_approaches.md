# Three Management Approaches 

**Imperative commands include** **run, expose, scale, edit, create deployment**
- best for learning how things work, learning/personal projects 

**Imperative objects**  These include **create -file.yml, replace -f file.yml, delete.....**
 - acts as a middle ground between Imperative commands and declaritive objects.
 - single file per command
 - documented approach with git-based yaml files, still hard to automate 
 
**Declaritive objects** use **apply -f.yml or dir\, diff**
 - best when only yaml is being used, for production and automation 
 - similar to swarm stacks, where updating requires using the same command
 
**Do not mix the 3 approaches** especially when there are production dependencies

- Learn Imperative for local and testing setups
- For first production then learn the apply, diff commands, yaml specification for resources that will be used
- Store yaml in git, commiting each change before applying 

This is good practise for GitOps where git commits are automatically applied to clusters