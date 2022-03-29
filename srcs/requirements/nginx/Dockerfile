FROM alpine:3.14

RUN apk update && apk add nginx

# ---------------------------- nginx configuration --------------------------- #
COPY nginx.conf /etc/nginx/http.d/default.conf
RUN sed -i -e 's/user nginx;/user  www-data;/g' /etc/nginx/nginx.conf
RUN adduser -S www-data

COPY tools/ /var/www/html/

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
