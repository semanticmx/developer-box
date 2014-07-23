httpd:
  service:
    - running
    - reload: True
    - watch:
      - file: /etc/httpd/conf/httpd.conf
      - file: /etc/httpd/conf.d/vhost.conf
      - file: /etc/php.ini
      - file: /var/www
      - file: /var/lib/php
      - file: /etc/yum.repos.d/ttomecek-django16-epel-6.repo 

mysqld:
  service:
    - running
    - reload: True

/etc/httpd/conf/httpd.conf:
  file.managed:
    - source: salt://httpd.conf

/etc/httpd/conf.d/vhost.conf:
  file.managed:
    - source: salt://vhost.conf

/etc/php.ini:
  file.managed:
    - source: salt://php.ini

/var/www:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 777
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

/var/lib/php:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 777
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

/etc/yum.repos.d/ttomecek-django16-epel-6.repo:
  file.managed:
    - source: salt://ttomecek-django16-epel-6.repo
