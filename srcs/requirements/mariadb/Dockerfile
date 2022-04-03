FROM alpine:3.14

RUN apk add mariadb mariadb-client openrc

RUN openrc \
	&& touch /run/openrc/softlevel \
	&& /etc/init.d/mariadb setup


RUn sed -ie "s/#bind-address=0.0.0.0/bind-address=0.0.0.0/g" /etc/my.cnf.d/mariadb-server.cnf \
	&& sed -ie "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf

COPY setup.sh .

ENTRYPOINT ["./setup.sh"]

# /usr/bin/mysql_install_db --user=mysql
# mkdir /run/mysqld
# touch /run/mysqld/mysqld.sock
