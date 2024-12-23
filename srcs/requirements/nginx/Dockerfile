FROM debian:bullseye 

RUN apt-get update && apt-get install -y nginx
RUN apt-get install vim -y
RUN apt-get install curl -y

# install Openssl to create SSL certificates
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y

#Generate a self signed SSL certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=state/L=bg/O=42 School/OU=42/CN=sel-jama.42.fr/UID=sel-jama/"

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
