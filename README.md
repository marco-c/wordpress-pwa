This repository contains a [Docker](https://www.docker.com/) image that bundles
[WordPress](https://wordpress.org/) with a plugin for
[Web Push Notifications](https://developer.mozilla.org/en-US/docs/Web/API/Push_API).
It extends the [official WordPress image](https://hub.docker.com/_/wordpress/)
and bundles the [wp-web-push plugin](https://github.com/marco-c/wp-web-push) with it.
It includes a [Docker Compose configuration file](https://github.com/mykmelez/wordpress-pwa/blob/master/docker-compose.yml) to compose its image with the [official MariaDB image](https://hub.docker.com/_/mariadb/).

To use this project, first [install the Docker Engine](https://docs.docker.com/engine/installation/)
(and create/start a Docker Machine on Mac).

Then clone the repository recursively to synchronize submodules:

```
git clone --recursive https://github.com/mykmelez/wordpress-pwa.git
```

Finally, change to the working directory and create/start a container with the image:

```
cd wordpress-pwa
docker-compose up
```

You should then be able to go to http://localhost:8080 on Linux to access
the WordPress installation. On Mac, replace `localhost` with the IP address
of your Docker machine (`docker-machine ip *name-of-machine*`).
