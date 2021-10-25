FROM debian:buster

RUN apt update && apt install wget php php-mysql -y

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php -O index.php

ENTRYPOINT [ "php", "-S", "0.0.0.0:5555" ]