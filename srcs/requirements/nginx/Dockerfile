FROM debian:bullseye

RUN apt-get update && apt-get install -y  nginx
RUN apt-get install vim -y
RUN apt-get install curl -y

#RUN apt-get install vim && apt-get install curl
#COPY nginx.conf /etc/nginx/nginx.conf

# nginx SSL
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=IDF/L=Paris/O=42 School/OU=42/CN=sel-jama.42.fr/UID=sel-jama/"

# nginx config
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
