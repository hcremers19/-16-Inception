# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:49:35 by hcremers          #+#    #+#              #
#    Updated: 2023/01/18 11:23:41 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image
FROM	alpine:3.16

# Install/Update packages
RUN		apk update
RUN		apk add --no-cache --quiet --update curl bash vim
RUN		apk add --no-cache --quiet --update mariadb-client
RUN		apk add --no-cache --quiet --update php7 php-phar php-json php-curl php-fpm php-mysqli php-iconv

# Create directory for wordpress
RUN		mkdir -p /var/www/wordpress

# Download wp CLI and access permissions
RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp 

# Allow the execution of wp
RUN		chmod +x /usr/bin/wp

# Download wordpress from wp CLI
RUN		wp core download --path=/var/www/wordpress

# Change working directory
WORKDIR /var/www/wordpress

# Copy configuration and entry point files
COPY	conf/wp-config.php /conf/wp-config
COPY	tools/entrypoint.sh /tmp/entrypoint.sh

# Allow the execution of entrypoint.sh
RUN		chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]