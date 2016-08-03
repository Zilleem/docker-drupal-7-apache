
FROM makuk66/docker-solr:5.0

# We just add a core with the search_api_solr config to the
# base image here.
RUN mkdir -p /opt/solr/server/solr/drupal/data
ADD conf/ /opt/solr/server/solr/drupal/conf/
ADD core.properties /opt/solr/server/solr/drupal/core.properties
