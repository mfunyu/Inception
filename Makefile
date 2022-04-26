
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
	docker container prune -f
	docker image rm nginx wordpress mariadb
	docker volume rm srcs_db-volume srcs_server-volume

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