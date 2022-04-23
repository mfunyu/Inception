#!/bin/sh

# wait for mariadb to start
while ! mysql -h mariadb -P 3306 -u wordpress -ppassword 2> /dev/null; do
sleep 1
done

wp core is-installed 2> /dev/null
if [ $? -ne 0 ] ; then
	wp core download --allow-root
	wp core config --dbname=wordpress \
				   --dbuser=wordpress  \
				   --dbpass=password \
				   --dbhost=mariadb:3306
	wp core install --url=mfunyu.42.fr \
					--title=mfunyu \
					--admin_user=mfunyu \
					--admin_password=password \
					--admin_email=mfunyu@example.com
	wp user create user \
					user@example.com \
					--user_pass=password
fi

/usr/sbin/php-fpm7
