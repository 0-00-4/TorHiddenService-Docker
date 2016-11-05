# TorHiddenService-Docker
A Dockerfile to create a quickly deployable Tor hidden service.

### Manually Building
Since this container needs access to the `hostname` and `private_key` files for a Tor Hidden Service at compile time, I have not yet hosted it on Docker Hub.

You can build this container directly by entering the directory containing the Dockerfile you want to build an image for, and using a command like:
```
docker build -t torhiddenservice .
```

You must ensure that the aforementioned `hostname` and `private_key` files are available in the same directory as the Dockerfile before attempting the build process.

### Deployment
Running a manually-built container is similar to the above:
```
docker run --link nginx:web --name onion torhiddenservice
```

This depends on a container called `nginx` running and exposing HTTP ports (`80`). You can find an example systemd service to auto-start the hidden service container [within my webpage repo](https://github.com/ajhaydock/alexhaydock.co.uk/blob/master/docker/alexhaydockonion.service).
