#!/bin/bash

service mariadb start
sleep 5

mariadb -u root << EOF
CREATE DATABASE IF NOT EXISTS \`database\`;

CREATE USER IF NOT EXISTS \`user\`@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON \`database\`.* TO \`user\`@'%';

# These two lines set a new password for the root user. The first line is for
# older versions of MariaDB, the second for newer versions
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root_password');
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_password';

FLUSH PRIVILEGES;
EOF

# Stop MariaDB to apply the configuration changes
mysqladmin -u root -proot_password shutdown

# Start MariaDB in safe mode
exec mysqld_safe
