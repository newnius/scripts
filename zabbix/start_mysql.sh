#!/bin/bash

docker service create \
				--name zabbix-mysql \
				--hostname zabbix-mysql \
				--replicas 1 \
				--network swarm-net \
				--detach=true \
				--env MYSQL_DATABASE="zabbix" \
				--env MYSQL_USER="zabbix" \
				--env MYSQL_PASSWORD="zabbix_pwd" \
				--env MYSQL_ROOT_PASSWORD="root_pwd" \
				--mount type=bind,source=/etc/localtime,target=/etc/localtime \
				mysql:5.7
				#--mount type=bind,source=/data/mysql/data,target=/var/lib/mysql \
