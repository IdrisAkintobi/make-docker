.PHONY: all up down logs shell build up-build clean help run start stop ps

all: up

up: ## Start LocalStack Pro (without building)
	@if [ -z "${LOCALSTACK_AUTH_TOKEN}" ]; then \
		if [ -f localstack.env ]; then \
			export $$(grep -v '^#' localstack.env | xargs); \
		else \
			read -p "Enter your LOCALSTACK_AUTH_TOKEN: " LOCALSTACK_AUTH_TOKEN_INPUT; \
			export LOCALSTACK_AUTH_TOKEN=$${LOCALSTACK_AUTH_TOKEN_INPUT}; \
			echo "LOCALSTACK_AUTH_TOKEN=$${LOCALSTACK_AUTH_TOKEN_INPUT}" > localstack.env; \
			echo "LOCALSTACK_AUTH_TOKEN saved to localstack.env"; \
		fi; \
	fi; \
	docker-compose up -d

up-build: ## Build and start LocalStack Pro
	@if [ -z "${LOCALSTACK_AUTH_TOKEN}" ]; then \
		if [ -f localstack.env ]; then \
			echo "Loading LOCALSTACK_AUTH_TOKEN from localstack.env"; \
			set -a; source localstack.env; set +a; \
			docker-compose up -d --build; \
		else \
			echo "Error: LOCALSTACK_AUTH_TOKEN environment variable is required for Pro build"; \
			echo "Usage: LOCALSTACK_AUTH_TOKEN=your-token make up-build"; \
			echo "Or create a localstack.env file with LOCALSTACK_AUTH_TOKEN=your-token"; \
			exit 1; \
		fi; \
	else \
		docker-compose up -d --build; \
	fi

down: ## Stop LocalStack Pro
	docker-compose down

logs: ## View LocalStack Pro logs
	docker-compose logs -f

shell: ## Access LocalStack Pro container shell
	docker-compose exec localstack bash

build: ## Build LocalStack Pro images
	@if [ -z "${LOCALSTACK_AUTH_TOKEN}" ]; then \
		if [ -f localstack.env ]; then \
			echo "Loading LOCALSTACK_AUTH_TOKEN from localstack.env"; \
			set -a; source localstack.env; set +a; \
			docker-compose build; \
		else \
			echo "Error: LOCALSTACK_AUTH_TOKEN environment variable is required for Pro build"; \
			echo "Usage: LOCALSTACK_AUTH_TOKEN=your-token make build"; \
			echo "Or create a localstack.env file with LOCALSTACK_AUTH_TOKEN=your-token"; \
			exit 1; \
		fi; \
	else \
		docker-compose build; \
	fi

clean: ## Clean up LocalStack Pro volumes
	docker-compose down -v

run: ## Start existing LocalStack Pro container (alias for up)
	@if [ -z "${LOCALSTACK_AUTH_TOKEN}" ]; then \
		if [ -f localstack.env ]; then \
			export $$(grep -v '^#' localstack.env | xargs); \
		else \
			read -p "Enter your LOCALSTACK_AUTH_TOKEN: " LOCALSTACK_AUTH_TOKEN_INPUT; \
			export LOCALSTACK_AUTH_TOKEN=$${LOCALSTACK_AUTH_TOKEN_INPUT}; \
			echo "LOCALSTACK_AUTH_TOKEN=$${LOCALSTACK_AUTH_TOKEN_INPUT}" > localstack.env; \
			echo "LOCALSTACK_AUTH_TOKEN saved to localstack.env"; \
		fi; \
	fi; \
	docker-compose start || docker-compose up -d

start: ## Create and start LocalStack Pro container (alias for up)
	@if [ -z "${LOCALSTACK_AUTH_TOKEN}" ]; then \
		if [ -f localstack.env ]; then \
			export $$(grep -v '^#' localstack.env | xargs); \
		else \
			read -p "Enter your LOCALSTACK_AUTH_TOKEN: " LOCALSTACK_AUTH_TOKEN_INPUT; \
			export LOCALSTACK_AUTH_TOKEN=$${LOCALSTACK_AUTH_TOKEN_INPUT}; \
			echo "LOCALSTACK_AUTH_TOKEN=$${LOCALSTACK_AUTH_TOKEN_INPUT}" > localstack.env; \
			echo "LOCALSTACK_AUTH_TOKEN saved to localstack.env"; \
		fi; \
	fi; \
	docker-compose up -d

stop: ## Stop LocalStack Pro (alias for down)
	docker-compose stop

ps: ## Show LocalStack Pro container status
	docker-compose ps

help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
