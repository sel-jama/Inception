# Use a lightweight base image
FROM debian:bullseye

# Install necessary packages
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN	mkdir -p /var/lib/mysql /var/run/mysqld
RUN	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
RUN	chmod 777 /var/run/mysqld

#/run/mysqld: MariaDB needs it to store infos abt its running process
#and changes the owner of the folder to the mysql user.
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld
#These lines make sure MariaDB has a place to store its important files 
#and the right permissions to access that folder


COPY ./tools/script.sh /
RUN chmod +x /script.sh
#RUN script.sh

# Run the script during container startup
CMD ["/script.sh"]

# Default command to keep the container running
#ENTRYPOINT ["mysqld_safe"]
