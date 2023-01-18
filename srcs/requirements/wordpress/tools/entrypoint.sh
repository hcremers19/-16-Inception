# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:44:00 by hcremers          #+#    #+#              #
#    Updated: 2023/01/18 13:45:15 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Store the file path in a variable
target="/etc/php7/php-fpm.d/www.conf"

# Ensure that the configuration has been done
grep -E "listen = 127.0.0.1" $target >/dev/null 2>&1
if [ $? -eq 0 ]; then

	# Make config
	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $target
	echo "env[MARIADB_HOST] = \$MARIADB_HOST" >>$target
	echo "env[MARIADB_USER] = \$MARIADB_USER" >>$target
	echo "env[MARIADB_PWD] = \$MARIADB_PWD" >>$target
	echo "env[MARIADB_DB] = \$MARIADB_DB" >>$target
fi

# Check if the file is here
if [ ! -f "wp-config.php" ]; then
	cp /config/wp-config ./wp-config.php

	sleep 5

	wp core install --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL" --skip-email

	wp plugin update --all

	wp user create $WP_USER $WP_USER_EMAIL --role=editor --user_pass=$WP_USER_PWD
fi

php-fpm7 --nodaemonize
