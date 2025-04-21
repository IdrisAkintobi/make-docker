# Variables
IMAGE_NAME = jenkins
CONTAINER_NAME = jenkins-container
PORT = 8080
VOLUME_NAME = jenkins-data
JENKINS_WAR = /usr/share/jenkins/jenkins.war

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Jenkins container
run:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):8080 \
		-v $(VOLUME_NAME):/var/jenkins_home \
		$(IMAGE_NAME)

# Start the Jenkins container
start:
	docker start $(CONTAINER_NAME)

# Stop the Jenkins container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the Jenkins container and associated volume
clean:
	@echo "Are you sure you want to remove the Jenkins container and associated volume? (y/n)"
	@read confirm; \
	if [ "$$confirm" = "y" ]; then \
		echo "Stopping and removing the Jenkins container..."; \
		docker ps -a -q --filter "name=$(CONTAINER_NAME)" | grep -q . && docker rm -f $(CONTAINER_NAME) || echo "No container found to remove"; \
		echo "Removing the Jenkins volume..."; \
		docker volume ls -q --filter "name=$(VOLUME_NAME)" | grep -q . && docker volume rm $(VOLUME_NAME) || echo "No volume found to remove"; \
	else \
		echo "Operation canceled."; \
	fi

# Show logs from the Jenkins container
logs:
	docker logs $(CONTAINER_NAME)

# List all Docker containers
ps:
	docker ps -a

# Get the Jenkins initial admin password
get_admin_password:
	@echo "Retrieving Jenkins initial admin password..."
	@docker exec $(CONTAINER_NAME) cat /var/jenkins_home/secrets/initialAdminPassword

# Help command to display available targets
help:
	@echo "Available targets:"
	@echo "  build          - Build the Docker image"
	@echo "  run            - Run the Jenkins container"
	@echo "  start          - Start the Jenkins container"
	@echo "  stop           - Stop the Jenkins container"
	@echo "  clean          - Remove the Jenkins container and associated volume"
	@echo "  logs           - Show logs from the Jenkins container"
	@echo "  ps             - List all Docker containers"
	@echo "  help           - Display this help message"
