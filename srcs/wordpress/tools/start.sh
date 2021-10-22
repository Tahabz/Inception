wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp
wp core download --allow-root

if [ ! -f "/www/wp-config.php" ]; then
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost=$DB_HOST --path="/www" --dbprefix=wp_ --allow-root
fi

wp core install --url="10.11.44.241" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --path="/www" --allow-root

php-fpm7.3 -F -R
