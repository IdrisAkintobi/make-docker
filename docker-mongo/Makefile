# Load environment variables from .env
include .env
export $(shell sed 's/=.*//' .env)

# Variables
CONTAINER_NAME = mongo-container

# Start the Docker Compose services (creates/recreates containers)
start:
	docker compose up -d

# Start existing containers without recreating
run:
	docker compose start

# Build the Docker images
build:
	docker compose up --build -d

# Check logs for the Mongo service
logs:
	docker compose logs --tail 50

# Connect to the mongo shell
connect:
	docker exec -it $(CONTAINER_NAME) mongosh -u $(MONGO_USERNAME) -p $(MONGO_PASSWORD) --authenticationDatabase admin

# Show replica set status
status:
	docker exec -it $(CONTAINER_NAME) mongosh \
		-u $(MONGO_USERNAME) \
		-p $(MONGO_PASSWORD) \
		--authenticationDatabase admin \
		--eval "rs.status()"

# Stop the Docker Compose services
stop:
	docker compose down

# Alias for stop
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
	@echo "  start       - Start the services defined in docker-compose.yml"
	@echo "  run         - Start existing containers without recreating"
	@echo "  build       - Build the Docker images"
	@echo "  stop        - Stop the services"
	@echo "  down        - Stop the services (alias for stop)"
	@echo "  clean       - Stop and remove the services, along with volumes"
	@echo "  logs        - View logs for the Mongo service"
	@echo "  connect     - Connect to the mongo shell"
	@echo "  status      - Show replica set status"
	@echo "  restart     - Restart the Docker services"
	@echo "  ps          - View the status of all services"
	@echo ""
	@echo "Connection string:"
	@echo "  mongodb://$(MONGO_USERNAME):$(MONGO_PASSWORD)@localhost:27017/$(MONGO_DATABASE)?replicaSet=rs0&authSource=admin"
