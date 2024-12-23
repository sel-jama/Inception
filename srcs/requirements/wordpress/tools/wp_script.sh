#!/bin/bash

cd /var/www/html

if [ ! -f "/var/www/html/wp-config.php" ]; then
    mv wp-config-sample.php wp-config.php

    wp config set DB_NAME ${MYSQL_DATABASE} --allow-root
    wp config set DB_USER ${MYSQL_USER} --allow-root
    wp config set DB_PASSWORD ${MYSQL_PASSWORD} --allow-root
    wp config set DB_HOST mariadb:3306 --allow-root
fi

sleep 5
wp core install --url=${DOMAIN_NAME} --title=${SITE_TITLE} --admin_user=${ADMIN_USER} --admin_email=${ADMIN_EMAIL} --admin_password=${ADMIN_PASS} --allow-root

wp user create --allow-root --role=author ${USER0_LOGIN} ${USER0_MAIL} --user_pass=${USER0_PASS}

php-fpm7.4 -F