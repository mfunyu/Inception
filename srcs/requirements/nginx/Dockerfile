FROM alpine:3.14

RUN apk update && apk add nginx

# ---------------------------- nginx configuration --------------------------- #
COPY nginx.conf /etc/nginx/http.d/default.conf

# setup www-data as user
RUN adduser -S www-data
RUN sed -i -e 's/user nginx;/user  www-data;/g' /etc/nginx/nginx.conf

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
