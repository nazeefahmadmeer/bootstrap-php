# bootstrap-php
A minimal php application using fatfreeframework for bootstrapping


# Setup

- Clone repo
- Provision vagrant: `cd bootstrap-php/vagrant && vagrant up`

#### Install dependencies
- `cd bootstrap-php/vagrant && vagrant ssh`
- `cd /vagrant/bootstrap-php`
- `php composer.phar install`

#### Setup Web server

- set `DocumentRoot` in `/etc/apache2/sites-enabled/000-default.conf` to `/vagrant/bootstrap-php`
- update permissions in `/etc/apache2/apache2.conf` from

```
<Directory /var/www/>
  Options Indexes FollowSymLinks
  AllowOverride None
  Require all granted
</Directory>
```

to

```
<Directory /vagrant/bootstrap-php>
  Options Indexes FollowSymLinks
  AllowOverride All
  Require all granted
</Directory>
```
- Restart apache2 : `sudo service apache2 restart`

Bingo!

Your app should be available at `http://192.168.69.10`
