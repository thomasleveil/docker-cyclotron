# docker-cyclotron

## Intro

[Cyclotron](http://www.cyclotron.io) is a web application for constructing dashboards.  This is a docker container to run Cyclotron.

This container is made up of two components:

* The Cyclotron API service
* The Cyclotron web application

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

Once this file is downloaded, you should edit it to change the hostname for the mongo database.  In the run example above where the mongodb is started, the container name is ```mongo```.  That means you should open this ```config.js``` file and change the database host to ```mongo```.

For example:

* Change this, from localhost:

```
module.exports = {
mongodb: 'localhost://mongo/cyclotron',
```

* To this, your mongodb hostname:

```
module.exports = {
mongodb: 'mongodb://mongo/cyclotron',
```

Additionally, the web service API defaults to running on port 8077.  If you need it to run on a different port, you must edit this ```config.js``` file and change the ```port``` line from 8077 to your new value.  For example, if you want to change the web service api to port 8888:

* Change this:

```
/* Port to run the Cyclotron Service on */
    port: 8077,
```

* To this:

```
/* Port to run the Cyclotron Service on */
    port: 8888,
```

If you do change the port from 8077, you must also tell the site which port to find the api (see the next section).


#### Site configuration file

To download the site configuration file (**configService.js**), run the following command on your host system:

```
wget https://raw.githubusercontent.com/hannah98/docker-cyclotron/master/configService.js
```

The web service API defaults to running on port 8077 (see the run command below).  If you change the port in your docker run command from 8077 to a new value, you must edit this ```configService.js``` file, and change any instances of ```http://localhost:8077``` to the new port value.  For example, if you want the web service API to run on port 8888, change ```http://localhost:8077``` to ```http://localhost:8888``` in the ```configService.js``` file.


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
* **```-p 80:8080```** - The port for the web application.  It runs on port 8080 inside the container, and in this example it is mapping to port 80 on your host server.  If you wish to run on a different port, change the 80 before the colon to a new value.
* **```-p 8077:8077```** - The port for the web service.  It runs on port 8077 inside the container, and in this example it is mapping to port 8077 on your host server.  If you wish to run on a different port, change the 80 before the colon to a new value.  **NOTE: If you change this port to a different value, you must update the ```configService.js``` file to set the correct port.**
* **```-v```** - mounts the configuration files into your running container.  The path before the colon is the path to the configuration file on your host server.





