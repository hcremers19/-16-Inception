# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:44:00 by hcremers          #+#    #+#              #
#    Updated: 2023/02/05 18:34:20 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Store the path to the file in a variable
target="/etc/php/7.3/fpm/pool.d/www.conf"

# Check if the configuration has already been done
grep -E "listen = 9000" $target >/dev/null 2>&1
if [ $? -ne 0 ]; then

	# Make the configuration if needed
	sed -i "s|.*listen = /run/php/php7.3-fpm.sock.*|listen = 9000|g" $target
fi

# Generate a wp-config.php
rm -fr /var/www/html/wordpress/wp-config.php
wp config create --dbname=$MARIADB_DB \
	--dbuser=$MARIADB_USER \
	--dbpass=$MARIADB_PWD \
	--dbhost=$MARIADB_HOST \
	--path="/var/www/html/wordpress/" \
	--allow-root \
	--skip-check

# Ensure that wordpress is correctly installed
if ! wp core is-installed --allow-root; then
	wp core install --url="$WP_URL" \
		--title="$WP_TITLE" \
		--admin_user="$WP_ADMIN" \
		--admin_password="$WP_ADMIN_PWD" \
		--admin_email="$WP_ADMIN_EMAIL" \
		--skip-email \
		--allow-root
fi

wp plugin update --all --allow-root

# Create new user
wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD --allow-root

php-fpm7.3 --nodaemonize
