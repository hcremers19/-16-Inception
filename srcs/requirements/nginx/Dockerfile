# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hcremers <hcremers@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 11:49:35 by hcremers          #+#    #+#              #
#    Updated: 2023/02/07 10:38:44 by hcremers         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Pull base image and update it
FROM    alpine:3.14
RUN     apk update

# Install nginx and openssl packages
RUN     apk add --no-cache --quiet --update nginx
RUN     apk add --no-cache --quiet --update openssl

# Create directory for nginx
RUN     mkdir -p /etc/nginx/ssl /var/run/nginx

# Generate certificate for the domain name
RUN     openssl req -x509 -nodes \
		-out /etc/nginx/ssl/hcremers.42.fr.crt \
		-keyout /etc/nginx/ssl/hcremers.42.fr.key \
		-subj "/C=BE/ST=Belgium/L=Brussels/O=42/OU=19/CN=hcremers.42.fr/UID=hcremers"

# Copy configuration file
COPY    ./conf/nginx.conf /etc/nginx/http.d/default.conf

# Expose the right port
EXPOSE  443

# Execute nginx without making it a daemon
CMD     nginx -g "daemon off;"