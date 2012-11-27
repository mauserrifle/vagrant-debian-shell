#!/bin/bash

# if sphinx does not exist
if [ ! -f /etc/sphinxsearch/sphinx.conf ];
then	
	# Install sphinx
	apt-get install -y sphinxsearch

	# Backup original sphinx conf as sample
	mv /etc/sphinxsearch/sphinx.conf /etc/sphinxsearch/sphinx.conf.sample

	# Copy updated sphinx conf
	cp /vagrant/src/etc/sphinxsearch/sphinx.conf /etc/sphinxsearch/sphinx.conf

	# Copy updated default sphinxsearch config so it automaticly starts
	cp /vagrant/src/etc/default/sphinxsearch /etc/default/sphinxsearch

	# Start sphinx
	/etc/init.d/sphinxsearch start
fi
