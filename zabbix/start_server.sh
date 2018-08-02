#!/bin/bash

docker service create \
				--name zabbix-server \
				--hostname zabbix-server \
				--replicas 1 \
				--network swarm-net \
				--detach=true \
		    --env DB_SERVER_HOST="zabbix-mysql" \
        --env MYSQL_DATABASE="zabbix" \
        --env MYSQL_USER="zabbix" \
        --env MYSQL_PASSWORD="zabbix_pwd" \
        --env MYSQL_ROOT_PASSWORD="root_pwd" \
        --env ZBX_JAVAGATEWAY="zabbix-java-gateway" \
				--publish 10051:10051 \
				--mount type=bind,source=/etc/localtime,target=/etc/localtime \
        zabbix/zabbix-server-mysql:latest		
