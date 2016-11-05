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
docker run --name onion torhiddenservice
```

You will need to tweak the Dockerfile to your needs. In my example, I am forwarding HTTP requests to the relevant port on my host IP (`172.16.16.30`). You almost certainly want to change this.

You can find an example systemd service to auto-start the hidden service container [within my webpage repo](https://github.com/ajhaydock/alexhaydock.co.uk/blob/master/docker/alexhaydockonion.service).
