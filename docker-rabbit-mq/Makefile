# Variables
IMAGE_NAME = rabbitmq:4-management
CONTAINER_NAME = rabbitmq-container
PORT = 5672
MGMT_PORT = 15672
CONFIG_FILE = rabbitmq.conf
VOLUME_NAME = rabbitmq-data
RABBITMQ_USER = admin
RABBITMQ_PASSWORD ?= secret

start:
	@echo "Enter RabbitMQ password (default: $(RABBITMQ_PASSWORD))"
	@read -p "Password: " input_password; \
	if [ -z "$input_password" ]; then \
		input_password=$(RABBITMQ_PASSWORD); \
	fi; \
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -p $(PORT):5672 \
	  -p $(MGMT_PORT):15672 \
	  -v $(VOLUME_NAME):/var/lib/rabbitmq \
	  -v $(CURDIR)/$(CONFIG_FILE):/etc/rabbitmq/rabbitmq.conf \
	  -e RABBITMQ_DEFAULT_USER=$(RABBITMQ_USER) \
	  -e RABBITMQ_DEFAULT_PASS=$input_password \
	  $(IMAGE_NAME)

run:
	docker start $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

clean:
	docker rm -f $(CONTAINER_NAME)
	docker volume rm $(VOLUME_NAME)

logs:
	docker logs $(CONTAINER_NAME)

ps:
	docker ps -a

help:
	@echo "Available targets:"
	@echo "  start          - Run the RabbitMQ container"
	@echo "  run            - Start the RabbitMQ container"
	@echo "  stop           - Stop the RabbitMQ container"
	@echo "  clean          - Remove the RabbitMQ container and volume"
	@echo "  logs           - Show logs"
	@echo "  ps             - List Docker containers"
