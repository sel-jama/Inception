#!/bin/bash

# Download WordPress core if not already present
   wp core download --allow-root
if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

    # Configure the database connection in wp-config.php
    wp config set DB_NAME database --allow-root --path=/var/www/wordpress/
    wp config set DB_USER user --allow-root --path=/var/www/wordpress/
    wp config set DB_PASSWORD password --allow-root --path=/var/www/wordpress/
    wp config set DB_HOST mariadb:3306 --allow-root --path=/var/www/wordpress/
fi

# sleep 10
# Install WordPress core
# wp core install --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/wordpress/
wp core install --url=admin --title=site --admin_user=user0 --admin_email=email@gmail.com --admin_password=1234 --allow-root --path=/var/www/wordpress

# Create an additional WordPress user
# wp user create --allow-root --role=author $USER0_LOGIN $USER0_MAIL --user_pass=$USER0_PASS --path='/var/www/wordpress'
wp user create --allow-root --role=author user user@gmail.com --user_pass=userpass --path=/var/www/wordpress

# Start PHP-FPM in the foreground
php-fpm7.4 -F

