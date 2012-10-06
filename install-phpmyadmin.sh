#!/bin/bash

# If phpmyadmin does not exist
if [ ! -f /etc/phpmyadmin/config.inc.php ];
then

	# Used debconf-get-selections to find out what questions will be asked
	# This command needs debconf-utils

	# Handy for debugging. clear answers phpmyadmin: echo PURGE | debconf-communicate phpmyadmin

	echo 'phpmyadmin phpmyadmin/dbconfig-install boolean false' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections

	echo 'phpmyadmin phpmyadmin/app-password-confirm password vagrant' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/admin-pass password vagrant' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/password-confirm password vagrant' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/setup-password password vagrant' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/database-type select mysql' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/app-pass password vagrant' | debconf-set-selections
	
	echo 'dbconfig-common dbconfig-common/mysql/app-pass password vagrant' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/mysql/app-pass password' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/password-confirm password vagrant' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/app-password-confirm password vagrant' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/app-password-confirm password vagrant' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/password-confirm password vagrant' | debconf-set-selections
	
	apt-get -y install phpmyadmin
fi
