if [ ! -f "/var/lib/mysql/ibdata1" ]; then
	mysql_install_db
fi


service mysql start

sed -i s/'127.0.0.1'/'0.0.0.0'/g /etc/mysql/mariadb.conf.d/50-server.cnf
mysql -e "CREATE DATABASE ${DB_NAME};"
mysql -e "CREATE USER '${DB_USER}'@'localhost' identified by '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "CREATE USER '${DB_USER}'@'%' identified by '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'"
mysql -e "FLUSH PRIVILEGES;"


mysql ${DB_NAME} < /wp.sql

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'toor';"
mysql -e "FLUSH PRIVILEGES;"

service mysql stop

mysqld_safe