
SRCDIR	:= ./srcs
DIR		:= $(SRCDIR)/requirements
COMPOSE	:= $(SRCDIR)/docker-compose.yml

all:
ifneq ($(shell uname), Darwin)
	@- $(DIR)/tools/setup.sh
endif
	docker-compose -f $(COMPOSE) up --build

clean:
	$(DIR)/tools/clean.sh

fclean:
	docker container prune -f
	docker image rm nginx wordpress
