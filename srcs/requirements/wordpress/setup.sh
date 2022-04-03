#!/bin/sh

# mysql -h mariadb -P 3306 -u wordpress -ppassword

if [ ! -e "wp-config.php" ] ; then
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
fi

/usr/sbin/php-fpm7