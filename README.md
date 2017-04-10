# docker-CMS-7-apache
Build a Drupal/Wordpress environment with docker containers for apache, mysql, solr and redis.

This repository contains a custom image from the php:5.6-apache docker image.
If you do not already have this docker image built it will build on your
first docker-compose up. This image will build with drush, drupal console, compose and wp-cli
for use when you are inside the cms container.

Next you can start your stack/containers with the docker-compose command
> docker-compose up
NOTE: include -d to run in detached mode

Bring down your stack/containers
> docker-compose down

You can view your images with...
> docker images

You can view your running containers with...
> docker ps

View all docker and docker-compose options with help
> docker help
> docker-compose help

If you do not already have a mysql and html folder they will be created.
You can now add the Drupal/Wordpress code base to the html/docroot folder.

Configure your settings file with MySQL.
Mysql will use the host as "db" and the database and
user info defined in the docker-compose file.

SSH into your Drupal/Wordpress container by listing the containers
> docker ps

Use the container id to execute bash in the container
> docker exec -it CONTAINERNAME /bin/bash

Importing db from outside the container
> docker exec -i CONTAINERNAME mysql -u root -pmysql cms < ./backup.sql

Importing db from outside the container
> docker exec -i CONTAINERNAME mysql -u root -pmysql cms < ./backup.sql

Use Drush inside the container within htdocs to import your sql file
> drush sqlc < ./backup.sql

Use wp-cli commands via 'docker exec'. For example, to install and activate the Quark theme:
> docker exec wp theme install quark docker exec wp theme activate quark

Use wp-cli commands via 'docker exec'. For example, to install and activate the Quark theme:

> docker exec <containername> wp theme install quark
> docker exec <containername> wp theme activate quark

