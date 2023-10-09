CPATH = srcs/compose.yml

COMPOSE = docker compose

all: up

re: rebuild up

mkdatadir:
	mkdir -p /home/tamather/data
	mkdir -p /home/tamather/data/db
	mkdir -p /home/tamather/data/wp

build: mkdatadir
	$(COMPOS)E -f $(CPATH) build

up: mkdatadir
	$(COMPOSE) -f $(CPATH) up -d

down:
	$(COMPOSE) -f $(CPATH) down

clean:
	$(COMPOSE) -f $(CPATH) down -v --rmi all --remove-orphans
	rm -rf /home/tamather/data
	rm -rf /home/tamather/data/db
	rm -rf /home/tamather/data/wp

logs:
	$(COMPOSE) -f $(CPATH) logs

ps:
	$(COMPOSE) -f $(CPATH) ps

stop:
	$(COMPOSE) -f $(CPATH) stop

start:
	$(COMPOSE) -f $(CPATH) start

restart:
	$(COMPOSE) -f $(CPATH) restart

rebuild: clean mkdatadir
	$(COMPOSE) -f $(CPATH) build --no-cache

prune:
	docker system prune -a

.PHONY: all build up down clean logs ps stop start restart rebuild reup re
