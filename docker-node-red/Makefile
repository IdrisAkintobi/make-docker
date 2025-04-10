# Variables
IMAGE_NAME = node-red
CONTAINER_NAME = node-red-container
PORT = 1880
VOLUME_NAME = node-red-data
CONFIG_FILE = settings.js
PACKAGE_FILE = package.json
CREDENTIAL_SECRET = secret
FLOWS_DIR = /data/flows.json
HOME_DIR = /usr/src/node-red

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Node-RED container
run:
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):1880 \
	  -e NODE_RED_CREDENTIAL_SECRET=$(CREDENTIAL_SECRET) \
	  -e FLOWS=$(FLOWS_DIR) \
	  -e NODE_RED_HOME=$(HOME_DIR) \
	  -v $(VOLUME_NAME):/data \
	  $(IMAGE_NAME)

# Start the Node-RED container
start:
	docker start $(CONTAINER_NAME)

# Stop the Node-RED container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Node-RED container and associated volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

# Show logs from the Node-RED container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  build    - Build the Docker image"
	@echo "  run      - Run the Node-RED container"
	@echo "  start    - Start the Node-RED container"
	@echo "  stop     - Stop the Node-RED container"
	@echo "  clean    - Remove the Node-RED container and associated volume"
	@echo "  logs     - Show logs from the Node-RED container"
	@echo "  ps       - List all Docker containers"
	@echo "  help     - Display this help message"
