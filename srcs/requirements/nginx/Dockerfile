FROM alpine:latest

RUN apk update && apk add nginx

COPY default.conf /etc/nginx/nginx.conf

# ---------------------------------- openssl --------------------------------- #
RUN mkdir /etc/nginx/ssl \
	&& cd /etc/nginx/ssl \
	&& openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out mfunyu.crt \
            -keyout mfunyu.key \
            -subj "/CN=JP"
