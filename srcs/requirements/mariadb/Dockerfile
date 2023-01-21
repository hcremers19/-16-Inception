# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:48:08 by hcremers          #+#    #+#              #
#    Updated: 2023/01/21 14:06:31 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image
FROM	alpine:3.14

# Install/Update mariadb packages
RUN		apk update
RUN		apk add --no-cache --quiet --update mariadb mariadb-client vim

# Create directories for the daemon
RUN 	mkdir -p /var/lib/mysqld /run/mysqld

# Copy configuration files
COPY	conf/create_db.sql /tmp/create_db.sql
COPY	tools/entrypoint.sh ./entrypoint.sh
COPY	conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Install database with authentication
RUN		mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

# Allow the execution of entrypoint.sh
RUN 	chmod +x ./entrypoint.sh

# Change the owner of the files
RUN		chown -R mysql:mysql /var/lib/mysql
RUN		chown -R mysql:mysql /run/mysqld

# Execute script
ENTRYPOINT ["sh", "entrypoint.sh"]