include srcs/.env

up: build
	if ! grep -q ${DOMAIN_NAME} /etc/hosts; then sudo sh -c "echo 127.0.0.1 ${DOMAIN_NAME} >> /etc/hosts"; fi;
	cd srcs && docker-compose up

build:
	mkdir -p /home/${VM_NAME}/data/db-data
	mkdir -p /home/${VM_NAME}/data/wp-data
	cd srcs && docker-compose build

down:
	cd srcs && docker-compose down

rm:
	sudo rm -rf /home/${VM_NAME}/data/db-data/*
	sudo rm -rf /home/${VM_NAME}/data/wp-data/*

re: rm down up