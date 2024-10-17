FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y 

RUN apt-get install mariadb-server -y

ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DB=database
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

# COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./utils/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT ["bash", "/script.sh"]
