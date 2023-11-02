FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

COPY conf/mysql.conf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN service mysql start && \
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" && \
    mysql -u root -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" && \
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' ;" && \
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;FLUSH PRIVILEGES;"
CMD ["mysqld"]