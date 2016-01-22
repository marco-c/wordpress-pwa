## Introduction

This repository contains a [Docker](https://www.docker.com/) image that bundles
[WordPress](https://wordpress.org/) with a plugin
for [Web Push Notifications](https://developer.mozilla.org/en-US/docs/Web/API/Push_API).
It extends the [official WordPress image](https://hub.docker.com/_/wordpress/)
with the [wp-web-push plugin](https://github.com/marco-c/wp-web-push).

It includes a
[Docker Compose file](https://github.com/mykmelez/wordpress-pwa/blob/master/docker-compose.yml)
to simplify starting a Docker container for this WordPress image with a container
for the [official MariaDB image](https://hub.docker.com/_/mariadb/), which provides
a database for the WordPress installation.

## Usage

To use this repository, first [install the Docker Engine](https://docs.docker.com/engine/installation/)
(and create/start a Docker Machine on Mac).

Then clone the repository (recursively, to synchronize submodules):

```
git clone --recursive https://github.com/mykmelez/wordpress-pwa.git
```

Finally, change to the working directory and create/start a container with the image:

```
cd wordpress-pwa
docker-compose up
```

You should be able to go to http://localhost:8080 on Linux to access
the WordPress installation. On Mac, replace `localhost` with the IP address
of your Docker machine (`docker-machine ip *name-of-machine*`).
