#!/bin/bash

# if wkhtmltopdf does not exist
if [ ! -f /opt/wkhtmltopdf/wkhtmltopdf ];
then	
	# Add wkhtmltopdf
	cp -R /vagrant/opt/wkhtmltopdf/ /opt/

	### Below are debian squeeze fixes, wheezy did not have these issues ###

	# Install dependencies
	apt-get -y install libxrender-dev libfontconfig1-dev

	# Fix libXrender dependency
	ln -s /usr/lib/libXrender.so /usr/local/lib/libXrender.so.1
fi
