FROM debian:buster

RUN apt-get update && apt install -y php7.3 php7.3-fpm php-mysql wget mariadb-client sendmail

RUN wget https://wordpress.org/latest.tar.gz -P ~
RUN tar -xvf ~/latest.tar.gz -C ~
RUN mkdir data/wp-data -p
RUN mv ~/wordpress /www
RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's/user = nobody/user = root/g'  /etc/php/7.3/fpm/pool.d/www.conf
RUN sed -i 's/group = nobody/group = root/g'  /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

RUN service php7.3-fpm start
COPY tools/start.sh /

ENTRYPOINT [ "sh", "/start.sh" ]
