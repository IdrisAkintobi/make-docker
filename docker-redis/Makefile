# Variables
IMAGE_NAME = valkey/valkey:8
CONTAINER_NAME = valkey-container
PORT = 6379
VOLUME_NAME = valkey-data
CONFIG_FILE = redis.conf

# Run the Valkey container with optional password
start:
	@echo "Enter Valkey password (press Enter for no password):"
	@read -s VALKEY_PASSWORD; \
	echo "Starting Valkey container..."; \
	PASS_FLAG=""; \
	if [ -n "$$VALKEY_PASSWORD" ]; then PASS_FLAG="--requirepass $$VALKEY_PASSWORD"; fi; \
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):$(PORT) \
	  -v $(VOLUME_NAME):/data \
	  -v $(CURDIR)/$(CONFIG_FILE):/etc/valkey/valkey.conf \
	  $(IMAGE_NAME) valkey-server /etc/valkey/valkey.conf $$PASS_FLAG && \
	echo "Valkey started on port $(PORT)"

# Connect to the Valkey server using valkey-cli
connect:
	docker exec -it $(CONTAINER_NAME) valkey-cli

# Start existing container without recreating
run:
	docker start $(CONTAINER_NAME)

# Stop the Valkey container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Valkey container and associated volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

# Show logs from the Valkey container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  start    - Run the Valkey container (prompts for optional password)"
	@echo "  run      - Start existing Valkey container"
	@echo "  connect  - Connect to the Valkey server using valkey-cli"
	@echo "  stop     - Stop the Valkey container"
	@echo "  clean    - Remove the Valkey container and associated volume"
	@echo "  logs     - Show logs from the Valkey container"
	@echo "  ps       - List all Docker containers"
	@echo "  help     - Display this help message"
