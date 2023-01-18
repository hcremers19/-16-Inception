# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:44:00 by hcremers          #+#    #+#              #
#    Updated: 2023/01/18 14:00:17 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Check if the setup file exists
cat .setup 2> /dev/null

if [$? -ne 0];
	then

	# Define the directory and execute mysqld_safe
	usr/bin/mysqld_safe --datadir=/var/lib/mysqld &

	# Wait until the mysql server is up
	while ! mysqladmin ping -h "$MARIADB_HOST" --silent;
		do
		sleep 1
	done

	# Execute the sql script in mariadb
	eval "echo \"(cat /tmp/create_db.sql)\"" | mariadb

	# Create the setup file
	touch .setup
fi

# Execute mysqld_safe and define the directory
/usr/bin/mysqld_safe --datadir=/var/lib/mysql