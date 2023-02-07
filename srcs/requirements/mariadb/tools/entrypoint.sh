# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:44:00 by hcremers          #+#    #+#              #
#    Updated: 2023/02/07 10:39:37 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Check if the setup file already exists
cat .setup 2> /dev/null

if [ $? -ne 0 ]; then
	# Execute mysqld_safe in the appropriate directory
	usr/bin/mysqld_safe --datadir=/var/lib/mysql &

	# Wait for the MySQL server to be up
	while ! mysqladmin ping -h "$MARIADB_HOST" --silent; do
    	sleep 1
	done

	# Execute the SQL script in MariaDB
	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb

	# Create the setup file
	touch .setup
fi

# Execute mysqld_safe in the appropriate directory
usr/bin/mysqld_safe --datadir=/var/lib/mysql
