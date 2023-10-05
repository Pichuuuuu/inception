CPATH = srcs/compose.yml

all: up

re: rebuild up

mkdatadir:
	mkdir -p /home/tamather/data
	mkdir -p /home/tamather/data/db
	mkdir -p /home/tamather/data/wp

build: mkdatadir
	docker-compose -f $(CPATH) build

up: mkdatadir
	docker-compose -f $(CPATH) up -d

down:
	docker-compose -f $(CPATH) down

clean:
	docker-compose -f $(CPATH) down -v --rmi all --remove-orphans
	rm -rf /home/tamather/data
	rm -rf /home/tamather/data/db
	rm -rf /home/tamather/data/wp

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

rebuild: clean mkdatadir
	docker-compose -f $(CPATH) build --no-cache

prune:
	docker system prune -a

.PHONY: all build up down clean logs ps stop start restart rebuild reup re
