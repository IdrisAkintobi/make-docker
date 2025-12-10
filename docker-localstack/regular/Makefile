.PHONY: all up down logs shell build up-build clean help start run stop

all: up

up: ## Start LocalStack (regular version, without building)
	docker-compose up -d

up-build: ## Build and start LocalStack (regular version)
	docker-compose up -d --build

down: ## Stop LocalStack
	docker-compose down

logs: ## View LocalStack logs
	docker-compose logs -f

shell: ## Access LocalStack container shell
	docker-compose exec localstack bash

build: ## Build LocalStack images
	docker-compose build

clean: ## Clean up LocalStack volumes
	docker-compose down -v

start: up ## Alias for up (compatibility with parent Makefile)

run: up ## Alias for up (compatibility with parent Makefile)

stop: down ## Alias for down (compatibility with parent Makefile)

help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
