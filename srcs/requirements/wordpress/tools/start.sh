if [ ! -f "/www/wp-config.php" ]; then
	wp core download --allow-root
	wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost=$DB_HOST --path="/www" --dbprefix=wp_ --allow-root
	wp config set WP_REDIS_HOST 'redis' --path="/www" --allow-root
	wp config set WP_REDIS_PORT 6379 --path="/www" --allow-root
	wp config set WP_REDIS_TIMEOUT 1 --path="/www" --allow-root
	wp config set WP_REDIS_READ_TIMEOUT 1 --path="/www" --allow-root
	wp config set WP_REDIS_DATABASE 0 --path="/www" --allow-root
fi

wp core install --url="${DOMAIN_NAME}" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --path="/www" --allow-root
wp plugin install redis-cache --path="/www" --activate --allow-root
cp /www/wp-content/plugins/redis-cache/includes/object-cache.php /www/wp-content

php-fpm7.3 -F -R
