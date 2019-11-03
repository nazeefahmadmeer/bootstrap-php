FROM ubuntu:16.04

# Install essentials
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install curl wget nano

# Install php
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt install -y php7.2
RUN apt install -y php7.2-curl php7.2-gd php7.2-json php7.2-mbstring

# Rewrite mod for fatfreeframework
RUN a2enmod rewrite

# Configure apache2
RUN sed -i "s|/var/www/html|/opt/bootstrap-php|" /etc/apache2/sites-enabled/000-default.conf
RUN sed -i "s|<Directory /var/www/>|<Directory /opt/bootstrap-php/>|" /etc/apache2/apache2.conf
RUN sed -i '/bootstrap-php/ { n; n; s/AllowOverride None/AllowOverride All/; }' /etc/apache2/apache2.conf

# Start apache2
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80
