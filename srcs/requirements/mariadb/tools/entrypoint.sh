# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    entrypoint.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:44:00 by hcremers          #+#    #+#              #
#    Updated: 2023/02/05 18:21:00 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Change the owner of the files
chown -R mysql:mysql /var/lib/mysql

# Check if the file already exists
if [ ! -d /var/lib/mysql/$MARIADB_DB ]; then

	# Start mysql in the right directory
	service mysql start --datadir=/var/lib/mysql

	# Create directory and file for the daemon
	mkdir -p /var/run/mysqld
	touch /var/run/mysqld/mysqlf.pid

	# Execute the SQL script in MariaDB
	eval "echo \"$(cat /tmp/create_db.sql)\"" | mariadb -u root

	# Set MySQL root password
	mysqladmin -u root password $MARIADB_ROOT_PWD

	service mysql stop --datadir=/var/lib/mysql

else
	# Create directory and file for the daemon
	mkdir -p /var/run/mysqld
	touch /var/run/mysqld/mysqlf.pid
	# mkfifo /var/run/mk

fi

# Change the owner of those files
chown -R mysql:mysql /var/run/mysqld

# Start the daemon
mysqld_safe --datadir=/var/lib/mysql
