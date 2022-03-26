FROM alpine:3.14

RUN apk update && apk add wget

RUN apk add --no-cache tini

WORKDIR /var/www/html/

RUN wget --inet4-only https://wordpress.org/latest.tar.gz \
	&& tar -xvf latest.tar.gz \
	&& rm latest.tar.gz

# ENTRYPOINT ["/sbin/tini","-vvv", "--"]
