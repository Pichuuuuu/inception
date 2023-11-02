FROM debian:buster

RUN apt-get update && apt-get install -y nginx
RUN apt install -y openssl

COPY conf/nginx.conf /etc/nginx/sites-enabled/incep.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=FR/ST=IDF/L=Paris/O=tamther/OU=tamather/CN=tamather"

CMD ["nginx", "-g", "daemon off;"]