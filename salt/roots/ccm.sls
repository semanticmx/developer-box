wordpress_db:
 mysql_database.present:
  - name: wp_ccm_dev
 mysql_user.present:
  - name: wordpress
  - password: password
 mysql_grants.present:
  - database: wp_ccm_dev.*
  - grant: ALL PRIVILEGES
  - user: wordpress
  - host: '%'

get_wordpress:
 cmd.run:
  - name: 'mkdir -p /var/www/html && wget http://wordpress.org/latest.tar.gz && tar xvzf latest.tar.gz && mv /tmp/wordpress/* /var/www/html/'
  - cwd: /tmp/

get_wp-cli:
 cmd.run:
  - name: 'curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
  - cwd: /home/vagrant/
  - user: vagrant
  - group: vagrant
  - mode: 755

/home/vagrant/wp:
 file:
  - symlink
  - target: /home/vagrant/wp-cli.phar

config_wordpress:
 cmd.run:
  - cwd: /var/www/html/
  - name: 'php ~/wp core config --dbname=wp_ccm_dev --dbuser=wordpress --dbpass=password'
  - user: vagrant

install_wordpress:
 cmd.run:
  - cwd: /var/www/html/
  - name: 'php ~/wp core install --url=http://ccm.proof.code/ --title=development --admin_user=sw-admin --admin_password=password --admin_email=sales@semantic.mx'
  - user: vagrant

