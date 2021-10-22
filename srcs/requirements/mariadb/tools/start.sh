if [ ! -f "/var/lib/mysql/ibdata1" ]; then
	mysql_install_db
fi


service mysql start

sed -i s/'127.0.0.1'/'0.0.0.0'/g /etc/mysql/mariadb.conf.d/50-server.cnf

mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'toor';
flush privileges;"
mysql -uroot -ptoor -e "CREATE DATABASE wpdb;"
mysql -uroot -ptoor -e "CREATE USER 'wpuser'@'%' identified by '12345';"
mysql -uroot -ptoor -e "GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'%' IDENTIFIED BY '12345'"
mysql -uroot -ptoor -e "FLUSH PRIVILEGES;"

mysql -uroot -ptoor wpdb < /wp.sql

service mysql stop

mysqld_safe
