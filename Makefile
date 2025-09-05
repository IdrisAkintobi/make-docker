# Root Makefile to manage all services

# Find all Makefiles in subdirectories, excluding the root Makefile
SERVICE_MAKEFILES = $(filter-out ./Makefile, $(shell find . -name Makefile))

# Extract the directory paths from the found Makefiles
SERVICES = $(patsubst %/Makefile,%,$(SERVICE_MAKEFILES))

# Default target: Show help
help:
	@echo "Available commands:"
	@echo "  start     - Interactively select and start services (creates new containers, builds first if needed)"
	@echo "  run       - Interactively select and start existing containers"
	@echo "  stop      - Interactively select and stop services"
	@echo "  clean     - Interactively select and clean services"
	@echo "  build     - Interactively select and build Docker services"
	@echo "  build-all - Build all Docker services"
	@echo "  ps        - Show status of all services"
	@echo "  logs      - Interactively select and view logs of services"
	@echo "  help      - Show this help message"

# Target to start services (handles existing containers automatically)
start:
	@echo "Select services to start (e.g., 1 2 4):"
	@i=1; for dir in $(SERVICES); do \
		echo "$$i. $$dir"; \
		i=$$((i+1)); \
	done
	@read -p "Enter selection: " selection; \
	for i in $$selection; do \
		dir=$$(echo $(SERVICES) | cut -d' ' -f$$i); \
		if [ -f "$$dir/Dockerfile" ]; then \
			echo "Building $$dir..."; \
			$(MAKE) -C $$dir build; \
		fi; \
		echo "Starting $$dir..."; \
		if $(MAKE) -C $$dir start 2>/dev/null; then \
			echo "$$dir started successfully"; \
		else \
			echo "Container exists, starting existing container..."; \
			$(MAKE) -C $$dir run; \
		fi; \
	done

# Target to run existing containers
run:
	@echo "Select services to run (e.g., 1 2 4):"
	@i=1; for dir in $(SERVICES); do \
		echo "$$i. $$dir"; \
		i=$$((i+1)); \
	done
	@read -p "Enter selection: " selection; \
	for i in $$selection; do \
		dir=$$(echo $(SERVICES) | cut -d' ' -f$$i); \
		echo "Running $$dir..."; \
		$(MAKE) -C $$dir run; \
	done

# Target to stop services
stop:
	@echo "Select services to stop (e.g., 1 2 4):"
	@i=1; for dir in $(SERVICES); do \
		echo "$$i. $$dir"; \
		i=$$((i+1)); \
	done
	@read -p "Enter selection: " selection; \
	for i in $$selection; do \
		dir=$$(echo $(SERVICES) | cut -d' ' -f$$i); \
		echo "Stopping $$dir..."; \
		$(MAKE) -C $$dir stop; \
	done

# Target to clean services
clean:
	@echo "Select services to clean (e.g., 1 2 4):"
	@i=1; for dir in $(SERVICES); do \
		echo "$$i. $$dir"; \
		i=$$((i+1)); \
	done
	@read -p "Enter selection: " selection; \
	for i in $$selection; do \
		dir=$$(echo $(SERVICES) | cut -d' ' -f$$i); \
		echo "Cleaning $$dir..."; \
		$(MAKE) -C $$dir clean; \
	done

# Target to build services
build: ## Interactively select and build Docker services
	@echo "Select services to build (e.g., 1 2 4):"
	@i=1; for dir in $(SERVICES); do \
		echo "$$i. $$dir"; \
		i=$$((i+1)); \
	done
	@read -p "Enter selection: " selection; \
	for i in $$selection; do \
		dir=$$(echo $(SERVICES) | cut -d' ' -f$$i); \
			echo "Building $$dir..."; \
			$(MAKE) -C $$dir build; \
	done

# Target to build all services
build-all: ## Build all Docker services
	@for dir in $(SERVICES); do \
		echo "Building $$dir..."; \
		$(MAKE) -C $$dir build; \
	done


# Target to show status of all services
ps:
	@for dir in $(SERVICES); do \
		echo "Status for $$dir:"; \
		$(MAKE) -C $$dir ps; \
		echo ""; \
	done

# Target to view logs of services
logs: ## Interactively select and view logs of services
	@echo "Select services to view logs (e.g., 1 2 4):"
	@i=1; for dir in $(SERVICES); do \
		echo "$$i. $$dir"; \
		i=$$((i+1)); \
	done
	@read -p "Enter selection: " selection; \
	for i in $$selection; do \
		dir=$$(echo $(SERVICES) | cut -d' ' -f$$i); \
		echo "Logs for $$dir:"; \
		$(MAKE) -C $$dir logs; \
		echo ""; \
	done

# Dynamic targets for individual service commands
define define_service_targets = 
$(strip $(1)-build: ## Build $(1) Docker service
	$(MAKE) -C $(1) build)
endef
$(foreach service,$(SERVICES),$(eval $(call define_service_targets,$(service))))

.PHONY: help start run stop clean build build-all ps logs