httpd:
  service:
    - running
    - reload: True
    - watch:
      - file: /etc/httpd/conf.d/vhost.conf

/etc/httpd/conf.d/vhost.conf:
  file.managed:
    - source: salt://vhost.conf