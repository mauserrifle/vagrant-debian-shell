#!/bin/bash

# Copy own sources.list to box
cp /vagrant/etc/apt/sources.list /etc/apt/sources.list

# Fetch packages
apt-get update
