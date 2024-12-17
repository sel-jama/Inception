#!/bin/bash

service mariadb start
sleep 5

mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;

CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';

# These two lines set a new password for the root user. The first line is for
# older versions of MariaDB, the second for newer versions
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';

FLUSH PRIVILEGES;
EOF

# Stop MariaDB to apply the configuration changes
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

# Start MariaDB in safe mode
exec mysqld_safe
