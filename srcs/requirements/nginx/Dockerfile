# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:49:35 by hcremers          #+#    #+#              #
#    Updated: 2023/02/03 15:06:31 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image
FROM	debian:buster
RUN		apt-get update
RUN		apt-get upgrade -y

# Install nginx and openssl packages
RUN		apt-get -y nginx openssl

# Copy configuration file
COPY	conf/nginx.conf /etc/nginx/sites-enabled/default.conf

# Create directory for nginx
RUN		mkdir -p /etc/ssl

# Generate certificate for the domain name
RUN		openssl req -x509 -nodes \
		-out /etc/nginx/ssl/nginx-selfsigned.crt \
		-keyout /etc/nginx/ssl/nginx-selfsigned.key \
		-subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=hcremers.42.fr/UID=hcremers"

# Execute nginx without making it a daemon
CMD		nginx -g "daemon off;"