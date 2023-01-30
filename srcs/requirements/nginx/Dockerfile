# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:49:35 by hcremers          #+#    #+#              #
#    Updated: 2023/01/25 15:38:23 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image
FROM	alpine:3.14

# Install/Update nginx and openssl packages
RUN		apk update
RUN		apk add --no-cache --quiet --update nginx
RUN		apk add --no-cache --quiet --update openssl

# Create directory for nginx
RUN		mkdir -p /etc/nginx/ssl /var/run/nginx

# Generate certificate for the domain name
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/hcremers.42.fr.crt -keyout /etc/nginx/ssl/hcremers.42.fr.key -subj "/C=FR/ST=IDF/L=Bruxelles/O=42/OU=42/CN=hcremers.42.fr/UID=hcremers"

# Copy configuration file
COPY	conf/nginx.conf /etc/nginx/http.d/default.conf

# Only expose port 443
EXPOSE	443

# Execute nginx without making it a daemon
CMD		["nginx", "-g", "daemon off;"]