# docker-CMS-7-apache
Build a Drupal/Wordpress environment with docker containers for apache, mysql, solr and redis.

This repository contains a custom image from the php:5.6-apache docker image.
If you do not already have this docker image built it will build on your
first docker-compose up

Next you can start your stack with the docker-compose command
> docker-compose up

If you do not already have a mysql and html folder they will be created.
You can now add the Drupal/Wordpress code base to the html/docroot folder.

Configure your settings file with MySQL, and Redis.
Mysql will use the host as "db" and the database and
user info defined in the docker-compose file.
Redis uses port 6375 and Solr uses host "solr" with 
path of /solr/drupal

SSH into your wordpress container by listing the containers
> docker ps

Use the container id to execute bash in the container
> docker exec -it YOUR_DOCKER_NAME /bin/bash

Importing db from outside the container
> docker exec -i CONTAINERNAME mysql -u root -pmysql wordpress < ./backup.sql

Importing db from outside the container
> docker exec -i CONTAINERNAME mysql -u root -pmysql wordpress < ./backup.sql

Use wp-cli commands via 'docker exec'. For example, to install and activate the Quark theme:
> docker exec wp theme install quark docker exec wp theme activate quark

Nagivate to localhost in your browser and/or localhost:8983/solr/# for the solr admin

Use wp-cli commands via 'docker exec'. For example, to install and activate the Quark theme:

> docker exec <containername> wp theme install quark
> docker exec <containername> wp theme activate quark

