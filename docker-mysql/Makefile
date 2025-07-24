# Variables
IMAGE_NAME = mysql
CONTAINER_NAME = mysql-container
PORT = 3306
VOLUME_NAME = mysql-data
CONFIG_FILE = .env
DB_NAME = my_database
DB_USER = user
DB_PASSWORD = password

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the MySQL container
start:
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):$(PORT) \
	  -v $(VOLUME_NAME):/var/lib/mysql \
	  --env-file $(CURDIR)/$(CONFIG_FILE) \
	  $(IMAGE_NAME)

# Connect to the MySQL server using mysql-client
connect:
	docker exec -it $(CONTAINER_NAME) mysql -u$(DB_USER) -p$(DB_PASSWORD) $(DB_NAME)

# Start the MySQL container
run:
	docker start $(CONTAINER_NAME)

# Stop the MySQL container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the MySQL container and associated volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

# Show logs from the MySQL container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  build    - Build the Docker image"
	@echo "  start    - Run the MySQL container"
	@echo "  run      - Start the MySQL container"
	@echo "  connect  - Connect to the MySQL server using mysql-client"
	@echo "  stop     - Stop the MySQL container"
	@echo "  clean    - Remove the MySQL container and associated volume"
	@echo "  logs     - Show logs from the MySQL container"
	@echo "  ps       - List all Docker containers"
	@echo "  help     - Display this help message"