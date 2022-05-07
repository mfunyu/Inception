
SRCDIR	:= ./srcs
DIR		:= $(SRCDIR)/requirements
COMPOSE	:= $(SRCDIR)/docker-compose.yml

all:
ifneq ($(shell uname), Darwin)
	@- $(DIR)/tools/setup.sh
endif
	docker-compose -f $(COMPOSE) up --build

clean:
	docker-compose -f $(COMPOSE) down
	$(DIR)/tools/clean.sh

fclean: clean
	-docker stop $(docker ps -qa) 2>/dev/null
	-docker rm $(docker ps -qa) 2>/dev/null
	-docker rmi -f $(docker images -qa) 2>/dev/null
	-docker volume rm $(docker volume ls -q) 2>/dev/null
	-docker network rm $(docker network ls -q) 2>/dev/null

re: clean
ifneq ($(shell uname), Darwin)
	@- $(DIR)/tools/setup.sh
endif
	docker-compose -f $(COMPOSE) build --no-cache
	docker-compose -f $(COMPOSE) up


# -------------------------------- docker exec ------------------------------- #
nginx:
	docker exec -it nginx /bin/sh

wp:
	docker exec -it wordpress /bin/sh

db:
	docker exec -it mariadb /bin/sh