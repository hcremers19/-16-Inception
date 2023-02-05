# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:49:35 by hcremers          #+#    #+#              #
#    Updated: 2023/02/05 18:28:43 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image and update it
FROM	debian:buster
RUN		apt-get update
RUN		apt-get upgrade -y

# Install packages
RUN		apt-get install -y php7.3 php7.3-fpm php7.3-mysql curl

# Create a directory for the wordpress files and use it as working directory
WORKDIR	/tmp/wordpress

# Copy the confguration file and allow its execution
COPY	tools/entrypoint.sh .
RUN		chmod +x ./entrypoint.sh

# Download the wp CLI
RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp

# Allow the execution of wp
RUN		chmod +x /usr/bin/wp

# Change the working directory
WORKDIR /var/www/html/wordpress

# Download wordpress from the wp CLI
RUN		wp core download --allow-root
RUN		chown -R www-data:www-data /var/www/html

# Execute the script
ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]