# Variables
IMAGE_NAME = minio
CONTAINER_NAME = minio-container
HOST_PORT = 9000
CONSOLE_PORT = 9001
DATA_VOLUME = minio-data
CONFIG_FILE = minio.env

# Run the MinIO container
run:
	@docker run -d \
	--name $(CONTAINER_NAME) \
	-p $(HOST_PORT):9000 \
	-p $(CONSOLE_PORT):9001 \
	-v $(DATA_VOLUME):/mnt/data \
	-v $(PWD)/$(CONFIG_FILE):/root/.minio/minio.env \
	--env-file $(PWD)/$(CONFIG_FILE) \
	$(IMAGE_NAME)

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Access MinIO logs
logs:
	docker logs $(CONTAINER_NAME)

# Stop and remove container and volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(DATA_VOLUME)

# Start/Stop
start:
	docker start $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

# List containers
ps:
	docker ps -a

# Show help
help:
	@echo "Available targets:"
	@echo "  build          - Build the Docker image"
	@echo "  run            - Run the MinIO container"
	@echo "  start          - Start the MinIO container"
	@echo "  stop           - Stop the MinIO container"
	@echo "  clean          - Remove container and volume"
	@echo "  logs           - View container logs"
	@echo "  ps             - List containers"
	@echo "  help           - Show this help"
