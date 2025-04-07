# Buildtime vs Runtime

- **Buildtime** statements affect the files in the image and how the image is being built
- **Runtime** statements are stored as metadata and affect the container itself
- Some statements affect both on how the image is built and the starting behaviour of the container 
- **Overwrite** statements replace any previous use
- **Additive** adds to any previous used commands
- Base (FROM) images may also affect downstream images 
- Understanding the effects help troubleshoot when Dockerfile and container issues arise