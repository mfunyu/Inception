
SRCDIR	:= ./srcs
DIR		:= $(SRCDIR)/requirements
COMPOSE	:= $(SRCDIR)/docker-compose.yml

all:
	$(DIR)/tools/setup.sh
	docker-compose -f $(COMPOSE) up --build

fclean:
	docker container prune -f
	docker image rm nginx wordpress
