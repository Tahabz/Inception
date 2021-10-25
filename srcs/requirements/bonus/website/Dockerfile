FROM debian:buster

RUN apt update && apt install nodejs -y

WORKDIR /

COPY conf/app.js /
COPY conf/index.html /

CMD [ "node", "app.js" ]