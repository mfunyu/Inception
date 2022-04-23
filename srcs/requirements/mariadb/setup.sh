#!/bin/sh

service mariadb start 2> /dev/null

# when crashed
service mariadb status
if [ $? -ne 0 ] ; then
service mariadb restart 2> /dev/null
fi

mysql -u root <<EOF
create user '${DB_USER}'@'%' identified by '${DB_PASSWD}';
create database ${DB_NAME};
grant all on ${DB_NAME}.* to '${DB_USER}'@'%';
EOF


tail -f  /dev/null