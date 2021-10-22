FROM debian:buster

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y\
    mariadb-server\
    mariadb-client

COPY tools/start.sh /
COPY conf/wp.sql /

ENTRYPOINT [ "sh", "/start.sh" ]