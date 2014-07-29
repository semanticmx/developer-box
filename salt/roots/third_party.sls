/etc/yum.repos.d/ttomecek-django16-epel-6.repo:
  file.managed:
    - source: salt://ttomecek-django16-epel-6.repo

/tmp/get-pip.py:
  file:
    - managed
    - source: salt://get-pip.py
