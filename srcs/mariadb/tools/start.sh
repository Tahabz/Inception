if [ ! -f "/var/lib/mysql/ibdata1" ]; then
	mysql_install_db
fi


service mysql start

sed -i s/'127.0.0.1'/'0.0.0.0'/g /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -uroot -e "CREATE DATABASE wpdb;"
mysql -uroot -e "CREATE USER 'wpuser'@'%' identified by '12345';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'%' IDENTIFIED BY '12345'"
mysql -uroot -e "FLUSH PRIVILEGES;"

mysql wpdb < /wp.sql

service mysql stop

mysqld_safe
