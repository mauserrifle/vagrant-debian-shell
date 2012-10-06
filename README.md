# Vagrant debian shell

This is a collection of shell scripts I am using setting up a LAMP box with 
debian squeeze.

Squeeze can be obtained @ <http://www.vagrantbox.es/>

## Shell files

### update-package-manager.sh 

Updates apt with the file within `etc/apt/sources.list`.

### install-lamp.sh

Installs apache2, php5, mysql-server, mysql-client, openssl,
php-pear, pecl_http, sendmail, mod_rewrite, ssl.

### install-nfs.sh

Installs the nfs client. Required when using the vagrant NFS setting.

### install-phpmyadmin.sh 

Installs phpmyadmin with pre-answers questions.

### install-wkhtmltopdf.sh

Sets up wkhtmltopdf. The binary should be placed in 
`opt/wkhtmltopdf/wkhtmltopdf`

<http://code.google.com/p/wkhtmltopdf/>

### cleanup.sh

Cleans up downloaded packages.

## Example vagrantfile

    Vagrant::Config.run do |config|
        config.vm.provision :shell, :inline => "sh /vagrant/update-package-manager.sh; sh /vagrant/install-nfs.sh; sh /vagrant/install-lamp.sh; sh /vagrant/install-phpmyadmin.sh; sh /vagrant/install-wkhtmltopdf.sh; sh /vagrant/cleanup.sh;"
    end
