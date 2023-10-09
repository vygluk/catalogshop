# Variables
$(info Importing ".env" file.)
include .env

ifneq ("$(wildcard ./.env.local)","")
  $(info Importing ".env.local" file.)
  include .env.local
endif

.SILENT:
.EXPORT_ALL_VARIABLES:

ifneq (, $(shell which docker-compose))
  DC=docker-compose
else
  DC=docker compose
endif

USER_ID!=id -u
GROUP_ID!=id -g
PROJECT_NAME=backend

ifndef PHPUNIT_CONFIGURATION
PHPUNIT_CONFIGURATION := phpunit.xml.dist
endif

# Help
help:
	echo
	echo
	echo "  Description: "
	echo
	echo "  Commands: "
	echo
	echo "    help             - Show available commands"
	echo "    start            - Start development environment"
	echo "    start-d          - Start development environment without image pull"
	echo "    stop             - Stop development environment"
	echo "    status           - Show docker container status"
	echo "    pull             - Pull all images"
	echo "    exec-php         - Exec into PHP container"
	echo "    exec-php-root    - Exec into PHP container with root user"
	echo "    exec-nginx       - Exec into Nginx container"
	echo "    exec-mysql       - Exec into MySQL container"
	echo
	echo

# Commands

start:
	$(DC) -p $(PROJECT_NAME) pull
	$(DC) -p $(PROJECT_NAME) up --build --remove-orphans

stop:
	$(DC) -p $(PROJECT_NAME) stop

start-d:
	$(DC) -p $(PROJECT_NAME) up -d --build --remove-orphans

status:
	$(DC) -p $(PROJECT_NAME) ps

exec-php:
	$(DC) -p $(PROJECT_NAME) exec -itu ${USER_ID} php sh

exec-php-root:
	$(DC) -p $(PROJECT_NAME) exec -itu root php sh

exec-mysql:
	$(DC) -p $(PROJECT_NAME) exec -u mysql mysql bash

run-composer:
	$(DC) -p $(PROJECT_NAME) run --rm -u ${USER_ID} php composer install