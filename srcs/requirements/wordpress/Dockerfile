# Pull base image and update it
FROM    alpine:3.14
RUN     apk update

# Install packages
RUN		apk add --no-cache --quiet --update curl bash vim
RUN		apk add --no-cache --quiet --update mariadb-client
RUN		apk add --no-cache --quiet --update php7 php-phar php-json php-curl php-fpm php-mysqli php-iconv

# Create a directory for the wordpress files
RUN		mkdir -p /var/www/wordpress

# Download the wp CLI
RUN     curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp

# Allow the execution of wp
RUN		chmod +x ./usr/bin/wp

# Download wordpress from the wp CLI
RUN		wp core download --path=/var/www/wordpress

# Change the working directory
WORKDIR /var/www/wordpress

# Copy the confguration file and allow its execution
COPY	conf/wp-config.php /conf/wp-config
COPY	./tools/entrypoint.sh /tmp/entrypoint.sh

RUN		chmod +x /tmp/entrypoint.sh

# Execute the script
ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]