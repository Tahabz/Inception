FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y\
  php-fpm\
  php-mysql\
  php-mbstring\
  unzip\
  wget\
  git

RUN mkdir -p /run/php