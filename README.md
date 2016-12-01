# docker-cyclotron

## Intro

[Cyclotron](http://www.cyclotron.io) is a web application for constructing dashboards.  This is a docker container to run Cyclotron.

## Prerequisites

### Mongo Database
This container needs a Mongo database to connect to.  The easiest way would be to start a MongoDB container using a command like this:

```
docker run --name mongo -v /my/own/datadir:/data/db -d mongo:3.2.3
```

### Configuration Files

This container requires 2 configuration files.  You must download them to your host system and mount them inside this container.

#### Service configuration file

To download the service configuration file (**config.js**), run the following command on your host system:

```
wget https://raw.githubusercontent.com/hannah98/docker-cyclotron/master/config.js
```

#### Site configuration file

To download the site configuration file (**configService.js**), run the following command on your host system:

```
wget https://raw.githubusercontent.com/hannah98/docker-cyclotron/master/configService.js
```

## Running this container

You must have these 3 pieces in place (see the **Prerequisites** section above):

* Running mongo database
* Site configuration file
* Service configuration file

If all of these conditions are met, this container can be started with something like the following command:

```
docker run -d --name=cyclotron --link mongo:mongo -p 80:8080 -p 8077:8077 -v $PWD/config.js:/cyclotron/cyclotron-svc/config/config.js -v $PWD/configService.js:/cyclotron/cyclotron-site/_public/js/conf/configService.js  furiousgeorge/cyclotron
```

### Description of the run command

* **```-d```** - runs the container in the background
* **```--name=cyclotron```** - the name of the container
* **```--link mongo:mongo```** - links to the mongo container.  The first "mongo" must match the name of your running mongo container.
* **```-d```** - runs the container in the background
* **```-d```** - runs the container in the background




