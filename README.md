## Introduction

This repository contains a [Docker](https://www.docker.com/) image that bundles
[WordPress](https://wordpress.org/) with a plugin
for [Web Push Notifications](https://developer.mozilla.org/en-US/docs/Web/API/Push_API).
It extends the [official WordPress base image](https://hub.docker.com/_/wordpress/)
with the [wp-web-push plugin](https://github.com/marco-c/wp-web-push).

It includes a
[Docker Compose configuration file](https://github.com/mykmelez/wordpress-pwa/blob/master/docker-compose.yml)
to simplify starting a Docker container for this WordPress image with a container
for the [official MariaDB image](https://hub.docker.com/_/mariadb/), which provides
a database for the WordPress installation.

The image is [listed on Docker Hub](https://hub.docker.com/r/mykmelez/wordpress-pwa/),
and it's an [automated build](https://docs.docker.com/docker-hub/builds/),
which means Docker Hub rebuilds the image whenever the repository is changed
or the WordPress base image is updated.

## Usage

To use this repository, [install the Docker Engine](https://docs.docker.com/engine/installation/)
(on Mac, also create/start a Docker Machine).

Then clone the repository (recursively, to synchronize the Git submodule),
change to its working directory, and create/start a container with the image:

```
git clone --recursive https://github.com/mykmelez/wordpress-pwa.git
cd wordpress-pwa
docker-compose up
```

You should be able to go to http://localhost:8080 on Linux to access
the WordPress installation. On Mac, replace `localhost` with the IP address
of your Docker machine (`docker-machine ip *name-of-machine*`).

## Deployment To *sloppy*

The repository includes a
[sloppy configuration file](https://github.com/mykmelez/wordpress-pwa/blob/master/sloppy.json)
to deploy the image to [sloppy](https://sloppy.io/). The file is based on
the [WordPress quickstarter](https://github.com/sloppyio/quickstarters/tree/master/wordpress).
To use it, invoke `sloppy` with the file and a set of variables to replace
references in the file:

```
sloppy start sloppy.json -var=USERNAME:*username*,URI:*mydomain.sloppy.zone*,DBUSER:*db-user-for-wordpress*,DBPASS:*db-password-for-wordpress*,DBROOT:*db-root-password*
```
