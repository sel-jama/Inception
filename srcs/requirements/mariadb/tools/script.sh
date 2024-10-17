#!/bin/bash

service mariadb start
sleep 5

# mariadb -u root -e "CREATE DATABASE IF NOT EXISTS \`database\`;"
# mariadb -u root -e "CREATE USER IF NOT EXISTS \`user\`@'%' IDENTIFIED BY 'password';"
# mariadb -u root -e "GRANT ALL PRIVILEGES ON database.* TO \`user\`@'%';"
# mariadb -u root -e "FLUSH PRIVILEGES;"

# mariadb -u root -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root_password');"
# mariadb -u root -e "FLUSH PRIVILEGES;"

# mariadb -u root -proot_password -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root_password';"
# mariadb -u root -proot_password -e "FLUSH PRIVILEGES;"

#kill $(cat /var/run/mysqld/mysqld.pid);

# # Start MariaDB service in the background
# service mariadb start

# # Wait for MariaDB to start
# sleep 10

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`database\`;

CREATE USER IF NOT EXISTS \`user\`@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON \`database\`.* TO \`user\`@'%';

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root_password');
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_password';

FLUSH PRIVILEGES;
EOF

# sleep 10
# # Stop MariaDB to apply the configuration changes
mysqladmin -u root -proot_password shutdown

# # Start MariaDB in safe mode
exec mysqld_safe

