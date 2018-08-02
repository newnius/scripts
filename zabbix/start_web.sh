#!/bin/bash

docker service create \
				--name zabbix-web \
				--hostname zabbix-web \
				--replicas 1 \
				--network swarm-net \
				--detach=true \
		    --env DB_SERVER_HOST="zabbix-mysql" \
        --env MYSQL_DATABASE="zabbix" \
        --env MYSQL_USER="zabbix" \
        --env MYSQL_PASSWORD="zabbix_pwd" \
        --env MYSQL_ROOT_PASSWORD="root_pwd" \
				--mount type=bind,source=/etc/localtime,target=/etc/localtime \
				zabbix/zabbix-web-nginx-mysql:latest
