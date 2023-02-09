# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:48:08 by hcremers          #+#    #+#              #
#    Updated: 2023/02/09 15:11:11 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image and update it
FROM	alpine:3.14
RUN		apk update

# Install mariadb packages
RUN		apk add --no-cache --quiet --update mariadb mariadb-client

# Create directory and file for the daemon
RUN		mkdir -p /var/lib/mysqld /run/mysqld

# Copy configuration files
COPY	conf/create_db.sql /tmp/create_db.sql
COPY	tools/entrypoint.sh ./entrypoint.sh
COPY	conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Install database with authentication
RUN		mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

# Allow execution and change owner and groups
RUN		chmod +x ./entrypoint.sh
RUN		chown -R mysql:mysql /var/lib/mysql
RUN		chown -R mysql:mysql /run/mysqld

# Execute script
ENTRYPOINT ["sh", "entrypoint.sh"]