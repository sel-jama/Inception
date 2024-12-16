#get the base image
FROM debian:bullseye 

#install NGINX and tools
#we need nginx to serve our website (it acts as the entrypoint to our infrastructure)
RUN apt-get update && apt-get install -y nginx
RUN apt-get install vim -y
RUN apt-get install curl -y

# install Openssl 
#to create SSL certificates
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y

#Generate a self signed SSL certificate
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/inception.crt \
       -keyout /etc/nginx/ssl/inception.key \
       -subj "/C=FR/ST=state/L=bg/O=42 School/OU=42/CN=sel-jama.42.fr/UID=sel-jama/"

# nginx config
# RUN mkdir -p /var/run/nginx

#copy our custom nginx config into the container 
COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html
# COPY web/index.html /var/www/html

#tell docker that this container will use port 443 *https
EXPOSE 443

#start nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
