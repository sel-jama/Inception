FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vim wget php7.4-fpm php7.4-mysql mariadb-client

RUN mkdir -p /var/www/html

COPY /conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php && chmod 775 /run/php

RUN wget https://wordpress.org/latest.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf latest.tar.gz && \
    cp -R wordpress/* /var/www/html/ && \
    rm -rf wordpress latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

COPY /tools/wp_script.sh /
RUN chmod +x /wp_script.sh

RUN chown -R www-data:www-data /var/www/html

RUN apt-get update && apt-get install -y sendmail

CMD ["/wp_script.sh"]
