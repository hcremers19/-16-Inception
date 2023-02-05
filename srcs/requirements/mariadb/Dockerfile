# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:48:08 by hcremers          #+#    #+#              #
#    Updated: 2023/02/03 11:10:29 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image and update it
FROM	debian:buster
RUN		apt-get update
RUN		apt-get upgrade -y

# Install mariadb package
RUN		apt-get install -y mariadb-server

# Copy configuration files
COPY	conf/create_db.sql		/tmp/create_db.sql
COPY	conf/mariadb-server.cnf	/etc/my.cnf
COPY	tools/entrypoint.sh		./entrypoint.sh

# Execute script
ENTRYPOINT ["sh", "entrypoint.sh"]