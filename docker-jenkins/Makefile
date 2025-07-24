# Variables
IMAGE_NAME = jenkins
CONTAINER_NAME = jenkins-container
PORT = 8080
VOLUME_NAME = jenkins-data

# Build the Docker image (plugins + tools + YAML)
build:
	docker build -t $(IMAGE_NAME) .

# Run the Jenkins container (mount Docker socket for Docker builds)
start:
	docker run -d \
		--name $(CONTAINER_NAME) \
		-p $(PORT):8080 \
		-v $(VOLUME_NAME):/var/jenkins_home \
		-v /var/run/docker.sock:/var/run/docker.sock \
		$(IMAGE_NAME)

# Start an existing container
run:
	docker start $(CONTAINER_NAME)

# Stop the Jenkins container
stop:
	docker stop $(CONTAINER_NAME)

# Clean everything (container + volume)
clean:
	@echo "Are you sure you want to remove the Jenkins container and data volume? (y/n)"
	@read confirm; \
	if [ "$$confirm" = "y" ]; then \
		docker rm -f $(CONTAINER_NAME) || true; \
		docker volume rm $(VOLUME_NAME) || true; \
	else \
		echo "Cancelled."; \
	fi

# View Jenkins logs
logs:
	docker logs -f $(CONTAINER_NAME)

# Get initial admin password
get_admin_password:
	docker exec $(CONTAINER_NAME) cat /var/jenkins_home/secrets/initialAdminPassword

help:
	@echo "Available targets:"
	@echo "  build  - Build Jenkins image with plugins and tools"
	@echo "  start  - Run Jenkins with Docker socket access"
	@echo "  run    - Start existing Jenkins container"
	@echo "  stop   - Stop Jenkins container"
	@echo "  clean  - Remove Jenkins container and volume"
	@echo "  logs   - Follow logs"
	@echo "  get_admin_password - Show Jenkins admin password"