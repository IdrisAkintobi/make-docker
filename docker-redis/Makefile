# Variables
IMAGE_NAME = redis
CONTAINER_NAME = redis-container
PORT = 6379
VOLUME_NAME = redis-data
CONFIG_FILE = redis.conf

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Redis container with a password prompt
start:
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):$(PORT) \
	  -v $(VOLUME_NAME):/data \
	  -v $(PWD)/$(CONFIG_FILE):/usr/local/etc/redis/redis.conf \
	  $(IMAGE_NAME)


# Use the below command to use with password
# run:
# 	@echo "Enter Redis password:"
# 	@read -s REDIS_PASSWORD; \
# 	docker run -d \
# 	  --name $(CONTAINER_NAME) \
# 	  -p $(PORT):$(PORT) \
# 	  -v $(VOLUME_NAME):/data \
# 	  -v $(PWD)/$(CONFIG_FILE):/usr/local/etc/redis/redis.conf \
# 	  -e REDIS_PASSWORD="$REDIS_PASSWORD" \
# 	  $(IMAGE_NAME)

# Connect to the Redis server using redis-cli
connect:
	docker exec -it $(CONTAINER_NAME) redis-cli

# Start the Redis container
run:
	docker start $(CONTAINER_NAME)

# Stop the Redis container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Redis container and associated volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

# Show logs from the Redis container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  build    - Build the Docker image"
	@echo "  start    - Run the Redis container (prompts for password)"
	@echo "  run      - Start the Redis container"
	@echo "  connect  - Connect to the Redis server using redis-cli"
	@echo "  stop     - Stop the Redis container"
	@echo "  clean    - Remove the Redis container and associated volume"
	@echo "  logs     - Show logs from the Redis container"
	@echo "  ps       - List all Docker containers"
	@echo "  help     - Display this help message"
