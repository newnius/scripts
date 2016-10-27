#! /bin/bash

docker service create \
--replicas 1 \
--name apache \
--network my-network \
--publish 80:80 \
--mount type=bind,source=/mnt/Data/webroot,target=/var/www/html \
--mount type=bind,source=/mnt/Data/weblogs,target=/var/log/apache2 \
-e ServerName=0.0.0.0 \
tagplus5/php7-apache
