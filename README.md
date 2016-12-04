# docker-wordpress-php5.6-apache
Build a wordpress environment with docker containers for apache, mysql, solr and redis.

This repository contains a custom image from the php:5.6-apache docker image.
If you do not already have this docker image built it will build on your
first docker-compose up

Next you can start your stack with the docker-compose command
> docker-compose up

If you do not already have a mysql and html folder they will be created.
You can now add our drupal code base to the html folder.

Configure your settings file with MySQL, and Redis.
Mysql will use the host as "db" and the database and
user info defined in the docker-compose file.
Redis uses port 6375.

SSH into your wordpress container by listing the containers
> docker ps

Use the container id to execute bash in the container
> docker exec -it YOUR_DOCKER_ID /bin/bash

Importing db from outside the container
> docker exec -i CONTAINERNAME mysql -u root -pmysql wordpress < ./backup.sql

Use wp-cli commands via 'docker exec'. For example, to install and activate the Quark theme:

> docker exec <containername> wp theme install quark
> docker exec <containername> wp theme activate quark

