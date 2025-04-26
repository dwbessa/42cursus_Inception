DOCKER_COMPOSE = docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all: build up

.PHONY: all build up down start stop restart logs clean re

build:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down

start:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) start

stop:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) stop

restart:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) restart

logs:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

clean: down
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	@if [ -n "$$(docker images -q)" ]; then docker rmi $$(docker images -q); fi

re: clean all