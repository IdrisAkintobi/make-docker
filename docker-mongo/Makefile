# Load environment variables from .env
include .env
export $(shell sed 's/=.*//' .env)

# Variables
CONTAINER_NAME = mongo-container
# Build the Docker images (optional, as you're using a pre-built image)
build:
	docker compose up --build -d

# Start the Docker Compose services
up:
	docker compose up -d

# Check logs for the Mongo service
logs:
	docker compose logs --tail 50

# Connect to the mongo shell
connect:
	docker exec -it $(CONTAINER_NAME) mongosh -u $(MONGO_USERNAME) -p $(MONGO_PASSWORD)

# Stop the Docker Compose services
down:
	docker compose down

# Stop and remove the Docker Compose services, along with volumes
clean:
	docker compose down -v

# Restart the Docker Compose services
restart:
	docker compose restart

# Show the status of the services
ps:
	docker compose ps -a

# Help message to display available targets
help:
	@echo "Available targets:"
	@echo "  build       - Build the Docker images"
	@echo "  up          - Start the services defined in docker-compose.yml"
	@echo "  down        - Stop the services"
	@echo "  clean       - Stop and remove the services, along with volumes"
	@echo "  logs        - View logs for the Mongo service"
	@echo "  restart     - Restart the Docker services"
	@echo "  ps          - View the status of all services"
