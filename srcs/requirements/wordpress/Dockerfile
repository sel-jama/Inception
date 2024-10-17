FROM debian:bullseye

# Update and install necessary packages
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vim wget php7.4-fpm php7.4-mysql mariadb-client

# Copy PHP-FPM configuration
COPY /tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create necessary directories with appropriate permissions
RUN mkdir -p /run/php && chmod 775 /run/php

# Download and set up WordPress
RUN wget https://wordpress.org/latest.tar.gz -P /var/www && \
   cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
   chmod +x /usr/local/bin/wp

# Copy the setup script and make it executable
COPY /tools/wp_script.sh /
RUN chmod +x /wp_script.sh

# Entrypoint to run the script
CMD ["/wp_script.sh"]

