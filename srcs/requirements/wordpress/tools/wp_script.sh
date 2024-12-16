#!/bin/bash

# Download WordPress core if not already present
cd /var/www/html

if [ ! -f "/var/www/html/wp-config.php" ]; then
    mv wp-config-sample.php wp-config.php

    # Configure the database connection in wp-config.php
    wp config set DB_NAME database --allow-root
    wp config set DB_USER user --allow-root
    wp config set DB_PASSWORD password --allow-root
    wp config set DB_HOST mariadb:3306 --allow-root
fi

sleep 10
wp core install --url=https://localhost --title=seljama_Site --admin_user=user0 --admin_email=email@gmail.com --admin_password=1234 --allow-root

wp user create --allow-root --role=author user user@gmail.com --user_pass=userpass

# Start PHP-FPM in the foreground
php-fpm7.4 -F