FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl


RUN mkdir -p /var/www/localhost/html
RUN echo "<h1>Hello World</h1>" > /var/www/localhost/html/index.html
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN sed -i 's/# server_names_hash_bucket_size 64;/server_names_hash_bucket_size 64;/g' /etc/nginx/nginx.conf 

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt\
    -subj "/C=MR/ST=Benguerir/L=Benguerir/O=Dis/CN=localhost"

RUN openssl dhparam -out /etc/nginx/dhparam.pem 100

COPY ./self-signed.conf /etc/nginx/snippets/
COPY ./ssl-params.conf /etc/nginx/snippets/
COPY ./localhost /etc/nginx/sites-available/

RUN apt-get update && apt-get install -y curl
