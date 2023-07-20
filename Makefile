CPATH = srcs/compose.yml

all: up

reup: rebuild up

re: rebuild restart

build:
	docker-compose -f $(CPATH) build

up:
	docker-compose -f $(CPATH) up -d

down:
	docker-compose -f $(CPATH) down

clean:
	docker-compose -f $(CPATH) down -v --rmi all --remove-orphans 

logs:
	docker-compose -f $(CPATH) logs

ps:
	docker-compose -f $(CPATH) ps

stop:
	docker-compose -f $(CPATH) stop

start:
	docker-compose -f $(CPATH) start

restart:
	docker-compose -f $(CPATH) restart

rebuild:
	docker-compose -f $(CPATH) build --no-cache

prune:
	docker system prune -a

.PHONY: all build up down clean logs ps stop start restart rebuild reup re
