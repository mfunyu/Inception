#!/bin/sh

service mariadb start 2> /dev/null

# when crashed
service mariadb status
if [ $? -ne 0 ] ; then
service mariadb restart 2> /dev/null
fi

mysql -u root <<EOF
create user 'wordpress'@'%' identified by 'password';
create database wordpress;
grant all on wordpress.* to 'wordpress'@'%';
EOF


tail -f  /dev/null