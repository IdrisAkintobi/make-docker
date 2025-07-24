# Variables
IMAGE_NAME = postgres
CONTAINER_NAME = postgres-container
PORT = 5432
VOLUME_NAME = postgres-data
CONFIG_FILE = postgres.conf
DB_NAME = app_db
DB_USER = postgres
# Default password is secret
DB_PASSWORD ?= secret

# Prompt for the password if not provided
start:
	@echo "Enter PostgreSQL password (default: $(DB_PASSWORD)):"
	@read -p "Password: " input_password; \
	if [ -z "$input_password" ]; then \
		input_password=$(DB_PASSWORD); \
	fi; \
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):$(PORT) \
	  -v $(VOLUME_NAME):/var/lib/postgresql/data \
	  -v $(CURDIR)/$(CONFIG_FILE):/usr/share/postgresql/postgresql.conf.sample \
	  -e POSTGRES_USER=$(DB_USER) \
	  -e POSTGRES_PASSWORD=$input_password \
	  -e POSTGRES_DB=$(DB_NAME) \
	  $(IMAGE_NAME)

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Connect to the PostgreSQL server using psql
connect:
	docker exec -it $(CONTAINER_NAME) psql -U $(DB_USER) -d $(DB_NAME)

# Start the PostgreSQL container
run:
	docker start $(CONTAINER_NAME)

# Stop the PostgreSQL container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the PostgreSQL container and associated volume
clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

# Show logs from the PostgreSQL container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Create a database
db.create:
	@echo "Enter the database name:"
	@read DB_NAME; \
	if [ -z "$$DB_NAME" ]; then \
		echo "Error: Database name cannot be empty!"; \
		exit 1; \
	else \
		docker exec -it $(CONTAINER_NAME) psql -U $(DB_USER) -d postgres -c "CREATE DATABASE $$DB_NAME;"; \
	fi


# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  build          - Build the Docker image"
	@echo "  start          - Run the PostgreSQL container"
	@echo "  run            - Start the PostgreSQL container"
	@echo "  connect        - Connect to the PostgreSQL server using psql"
	@echo "  stop           - Stop the PostgreSQL container"
	@echo "  clean          - Remove the PostgreSQL container and associated volume"
	@echo "  logs           - Show logs from the PostgreSQL container"
	@echo "  ps             - List all Docker containers"
	@echo "  db.create      - Create a database"
	@echo "  help           - Display this help message"
