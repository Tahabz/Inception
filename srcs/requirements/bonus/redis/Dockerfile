FROM debian:buster

RUN apt update && apt install redis -y

CMD ["redis-server", "--protected-mode no"]