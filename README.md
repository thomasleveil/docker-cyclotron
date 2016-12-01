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

