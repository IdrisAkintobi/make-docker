COMPOSE_FILE = docker-compose.yml
PROJECT_NAME = kafka_confluentinc

# Start Kafka and Zookeeper
run:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d

# Stop and remove all containers
stop:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) stop

clean:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down -v

# Show logs for Kafka
logs:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs kafka

# Show all logs
logs.all:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs

# Restart Kafka
restart:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) restart kafka

# List all containers
ps:
	docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) ps

# Help command
help:
	@echo "Available targets:"
	@echo "  run         - Start Kafka and Zookeeper"
	@echo "  stop        - Stop containers"
	@echo "  clean       - Stop and remove all containers and volumes"
	@echo "  logs        - Show Kafka logs"
	@echo "  logs.all    - Show all service logs"
	@echo "  restart     - Restart Kafka container"
	@echo "  ps          - List containers"
	@echo "  help        - Show this help message"

