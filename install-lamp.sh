#!/bin/bash

# if apache2 does no exist
if [ ! -f /etc/apache2/apache2.conf ];
then
	# Install MySQL
	echo 'mysql-server-5.1 mysql-server/root_password password vagrant' | debconf-set-selections
	echo 'mysql-server-5.1 mysql-server/root_password_again password vagrant' | debconf-set-selections
	apt-get -y install mysql-client mysql-server-5.1

	# Install Apache2
	apt-get -y install apache2

	# Install PHP5 support
	apt-get -y install php5 libapache2-mod-php5 php-apc php5-mysql php5-dev

	# Install SSL tools
	#apt-get -y install ssl-cert

	# Install OpenSSL
	apt-get -y install openssl

	# Install PHP pear
	apt-get -y install php-pear

	# Install sendmail
	apt-get -y install sendmail

	# Install CURL dev package
	apt-get -y install libcurl4-openssl-dev

	# Install PECL HTTP (depends on php-pear, php5-dev, libcurl4-openssl-dev)
	printf "\n" | pecl install pecl_http

	# Enable PECL HTTP
	echo "extension=http.so" > /etc/php5/conf.d/http.ini

	# Enable mod_rewrite	
	a2enmod rewrite

	# Enable SSL
	a2enmod ssl

	# Add www-data to vagrant group
	usermod -a -G vagrant www-data

	# Restart services
	/etc/init.d/apache2 restart
fi
