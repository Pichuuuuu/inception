#install wordpress

FROM debian:buster


ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

ARG WP_ADMIN_USER
ARG WP_ADMIN_PASS
ARG WP_ADMIN_MAIL
ARG WP_USER
ARG WP_PASS
ARG WP_MAIL
ARG WP_URL
ARG WP_TITLE

RUN apt-get update
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql
RUN apt-get install -y wget

RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir /run/php

WORKDIR /tmp
RUN wget -O wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
RUN wp core download --allow-root

RUN wp core config  --dbhost=mariadb \
                    --dbname=${MYSQL_DATABASE} \    
                    --dbuser=${MYSQL_USER} \    
                    --dbpass=${MYSQL_PASSWORD} \
                    --skip-check \
                    --allow-root
RUN chmod 600 wp-config.php

RUN chown -R www-data:www-data /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress

CMD ["/bin/bash", "-c", "/usr/local/bin/wp core install --path=/var/www/wordpress\
                    --url=${WP_URL} \
                    --title=${WP_TITLE} \
                    --admin_name=${WP_ADMIN_USER} \
                    --admin_password=${WP_ADMIN_PASS} \
                    --admin_email=${WP_ADMIN_MAIL} \
                    --allow-root && \
                    wp user create ${WP_USER} ${WP_MAIL} --role=author --user_pass=${WP_PASS} --allow-root 2> /dev/null;\
                    /usr/sbin/php-fpm7.3 -F"]
