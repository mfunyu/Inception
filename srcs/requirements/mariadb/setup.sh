#!/bin/sh

service mariadb start 2> /dev/null

# when crashed
service mariadb status
if [ $? -ne 0 ] ; then
service mariadb restart 2> /dev/null
fi

if [ ! -d /var/lib/mysql/mysql ] ; then
mysql -u root <<EOF
create user '${MYSQL_USER}'@'%' identified by '${MYSQL_PASSWORD}';
create database ${MYSQL_DATABASE};
grant all on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'%';
delete from mysql.user where user='';
delete from mysql.user where user='root';
flush privileges;
EOF
fi

tail -f  /dev/null