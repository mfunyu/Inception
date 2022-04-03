#!/bin/sh

service mariadb start 2> /dev/null

mysql -u root <<EOF
create user 'wordpress'@'%' identified by 'password';
create database wordpress;
grant all on wordpress.* to 'wordpress'@'%';
EOF


tail -f  /dev/null