# furiousgeorge/cyclotron

## tl;dr

    git clone https://github.com/hannah98/docker-cyclotron.git
    cd docker-cyclotron
    docker-compose up -d
    # then go to http://<your-docker-host>:12345/


## Intro

[Cyclotron](http://www.cyclotron.io) is a web application for constructing dashboards.  This is a docker-compose project running the Cyclotron application.

This docker-compose project is made up of three containers:

* A MongoDB database
* The Cyclotron API service
* The Cyclotron web application

## Prerequisites

- docker
- docker-compose

## Changing port `12345` 

By default the application will be listening on port `12345` of your docker host. To change that port, edit the
[.env](.env) file:

      CYCLOTRON_PORT=12345


## Starting the application

    docker-compose up -d


