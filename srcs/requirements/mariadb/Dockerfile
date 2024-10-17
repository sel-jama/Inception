# Use a lightweight base image
FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y \
&& apt-get install -y mariadb-server

# RUN	mkdir -p /var/lib/mysql /var/run/mysqld
# RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
# RUN	chmod 777 /var/run/mysqld

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld


COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Environment variables for MariaDB setup
# ENV MYSQL_ROOT_PASSWORD=root_password
# ENV MYSQL_DATABASE=database
# ENV MYSQL_USER=user
# ENV MYSQL_PASSWORD=password

COPY ./tools/script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh
#RUN script.sh

EXPOSE 3306
# Run the script during container startup
ENTRYPOINT ["script.sh"]

# Default command to keep the container running
#ENTRYPOINT ["mysqld_safe"]


# FROM debian:bullseye

# ARG MYSQL_DATABASE
# ARG MYSQL_USER
# ARG MYSQL_PASSWORD

# RUN apt update -y && apt upgrade -y
# RUN apt install -y vim
# RUN apt install -y mariadb-server


# #::::::::::::::::::::::::::::::::::Config:::::::::::::::::::::::::::
# COPY tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# #::::::::::::::::::::::::::::::::::Setup:::::::::::::::::::::::::::
# COPY tools/script.sh /usr/local/bin/script.sh
# RUN chmod +x /usr/local/bin/script.sh
# RUN script.sh

# EXPOSE      3306

# ENTRYPOINT  [ "mysqld_safe" ]
