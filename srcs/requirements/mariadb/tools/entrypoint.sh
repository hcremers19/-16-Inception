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

# mysql -u root -p
# SHOW DATABASES;
# use 'wordpress';
# SHOW TABLES;
# SELECT wp_users.display_name FROM wp_users;
# SELECT *  FROM wp_users;