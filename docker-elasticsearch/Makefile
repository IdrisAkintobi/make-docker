# Variables
IMAGE_NAME = elasticsearch
CONTAINER_NAME = elasticsearch-container
PORT = 9200
VOLUME_NAME = elasticsearch-data
CONFIG_FILE = elasticsearch.yml
JAVA_OPTS = '-Xms512m -Xmx512m'
# Default password is elastic
ELASTIC_PASSWORD ?= elastic

# Prompt for the password if not provided
start:
	@echo "Enter Elasticsearch password (default: $(ELASTIC_PASSWORD)):
	@read -p "Password: " input_password; \
	if [ -z "$input_password" ]; then \
		input_password=$(ELASTIC_PASSWORD); \
	fi; \
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):$(PORT) \
	  -v $(VOLUME_NAME):/usr/share/elasticsearch/data \
	  -v $(CURDIR)/$(CONFIG_FILE):/usr/share/elasticsearch/config/elasticsearch.yml \
	  -e ELASTIC_PASSWORD=$input_password \
	  -e ES_JAVA_OPTS=$(JAVA_OPTS) \
	  $(IMAGE_NAME)

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Start the Elasticsearch container
run:
	docker start $(CONTAINER_NAME)

# Stop the Elasticsearch container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Elasticsearch container and associated volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

# Show logs from the Elasticsearch container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Show status of Elasticsearch container
status:
	docker inspect -f '{{.State.Status}}' $(CONTAINER_NAME)

# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  build          - Build the Docker image"
	@echo "  start          - Run the Elasticsearch container"
	@echo "  run            - Start the Elasticsearch container"
	@echo "  stop           - Stop the Elasticsearch container"
	@echo "  clean          - Remove the Elasticsearch container and associated volume"
	@echo "  logs           - Show logs from the Elasticsearch container"
	@echo "  ps             - List all Docker containers"
	@echo "  status         - Show the status of the Elasticsearch container"
	@echo "  help           - Display this help message"
