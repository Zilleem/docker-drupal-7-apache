# docker-drupal-7-apache
Build a Drupal 7 environment with docker containers for apache, mysql, solr and redis.

# This repository contains a custom image from the php:5.6-apache docker image.
# If you do not already have this docker image built you will need to run the following.
> docker build -t zilleem-d7 .

# Next you can start your stack with the docker-compose command
> docker-compose up

# If you do not already have a mysql and htdocs folder they will be created.
# You can now add our drupal code base to the htdocs folder.

# Configure your settings file with MySQL, Redis and Solr.
# Mysql will use the host as "db" and the database and
# user info defined in the docker-compose file.
# Redis has port 6375 and Solr is host "solr" with 
# path of /solr/drupal

# SSH into your d7 container by listing the containers
> docker ps
# Use the container id to execute bash in the container
> docker exec -it YOUR_DOCKER_ID /bin/bash

# User Drush inside the container within htdocs to import your sql file
> drush sqlc < ../import.sql

# Nagivate to localhost in your browser and/or localhost:8983/solr/# for the solr admin


