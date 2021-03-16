# —— Setup ————————————————————————————————————————————————————————————————————————
DC             = docker-compose
PROJECT_DIR    = /phpfolio
RUN            = $(DC) run --rm
EXEC           = $(DC) exec

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

start: build up ## Install and start the project

stop: ## Remove docker containers
	@echo "Stopping containers"
	@$(DC) kill > /dev/null
	@$(DC) rm -v --force > /dev/null
	@echo "Container stopped"

reset: stop start ## Reset the whole project

build:
	@echo "Building images"
	@$(DC) build > /dev/null

up:
	@echo "Starting containers"
	@$(DC) up -d --remove-orphans
