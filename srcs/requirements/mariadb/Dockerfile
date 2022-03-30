FROM alpine:3.14

RUN apk add mariadb mariadb-client openrc

RUN openrc \
	&& touch /run/openrc/softlevel \
	&& /etc/init.d/mariadb setup
	# && service mariadb start \
	# && mysql -u root -p mysql

ENTRYPOINT ["tail", "-f", "/dev/null"]

# /usr/bin/mysql_install_db --user=mysql
# mkdir /run/mysqld
# touch /run/mysqld/mysqld.sock
