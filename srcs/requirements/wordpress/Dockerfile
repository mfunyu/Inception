FROM alpine:3.14

RUN apk update && apk add wget

# RUN apk add --no-cache tini

# RUN apk add --update php7 \
# 	php-common \
# 	php-cli \
# 	php-mbstring \
# 	php-bz2
# 	php7-mysqli php7-opcache php7-xml php7-apache2 \
# 	php7-phar \
# 	php7-json

# ------------------------------------ php ----------------------------------- #
RUN apk add php7 php-fpm \
	php7-json \
	php7-phar

# --------------------------------- wordpress -------------------------------- #
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

# ENTRYPOINT ["/sbin/tini","-vvv", "--"]
