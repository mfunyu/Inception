FROM alpine:3.14

RUN apk update && apk add nginx

COPY nginx.conf /etc/nginx

# ---------------------------------- openssl --------------------------------- #
RUN apk add openssl \
	&& mkdir /etc/nginx/ssl \
	&& cd /etc/nginx/ssl \
	&& openssl req -x509 \
            -nodes \
            -subj "/CN=JP" \
            -out nginx.crt \
            -keyout nginx.key

ENTRYPOINT ["nginx", "-g", "daemon off;"]
