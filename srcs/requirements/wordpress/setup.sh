#!/bin/sh

# wait for mariadb to start
while ! mysql -h mariadb -P 3306 -u wordpress -ppassword 2> /dev/null; do
sleep 1
done

wp core is-installed 2> /dev/null
if [ $? -ne 0 ] ; then
	wp core download --allow-root
	wp core config --dbname=${DB_NAME} \
				   --dbuser=${DB_USER} \
				   --dbpass=${DB_PASSWD} \
				   --dbhost=mariadb:3306
	wp core install --url=${DOMAIN} \
					--title=${TITLE} \
					--admin_user=${WP_ADMIN} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--admin_password=${WP_ADMIN_PASSWD}
	wp user create ${WP_USER} \
					${WP_USER_EMAIL} \
					--user_pass=${WP_USER_PASSWD}
fi

/usr/sbin/php-fpm7
