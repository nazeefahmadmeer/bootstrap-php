# Installing php
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y php7.2

# Installing commons php libs
sudo apt install php7.2-curl php7.2-gd php7.2-json php7.2-mbstring

# Installing apache2
sudo apt install apache2 libapache2-mod-php7.2

# Enabling mod-rewrite for php required by f3 framewrok
sudo a2enmod rewrite

# Configure apache2

sudo sed -i "s|/var/www/html|/vagrant/bootstrap-php|" /etc/apache2/sites-enabled/000-default.conf
sudo sed -i "s|<Directory /var/www/>|<Directory /vagrant/bootstrap-php/>|" /etc/apache2/apache2.conf
sudo sed -i '/bootstrap-php/ { n; n; s/AllowOverride None/AllowOverride All/; }' /etc/apache2/apache2.conf

sudo service apache2 restart
