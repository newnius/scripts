#! /bin/bash

docker service create \
--replicas 1 \
--name mysql \
--network my-network \
--endpoint-mode dnsrr \
--user 1000:1000 \
--mount type=bind,source=/mnt/Data/mysql,target=/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
mysql:5.6
