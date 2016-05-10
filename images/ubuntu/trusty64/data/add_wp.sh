#!/bin/bash

if test $1
then
container_name=$1
echo -e 'Creating MySQL container for' $container_name
# create mysql container
sudo docker run --name $container_name-mysql -e MYSQL_ROOT_PASSWORD=password -d mysql:latest
# create wordpress container
sudo docker run --name $container_name-wordpress -p 80:80 --link $container_name-mysql:mysql -d wordpress
fi

sudo docker ps

