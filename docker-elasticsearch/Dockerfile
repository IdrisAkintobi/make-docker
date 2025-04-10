# Use the official Elasticsearch image from Docker Hub
FROM docker.elastic.co/elasticsearch/elasticsearch:8.17.2

# Copy the custom elasticsearch.yml into the container
COPY ./elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Expose Elasticsearch port
EXPOSE 9200

# Run Elasticsearch
CMD ["eswrapper"]
