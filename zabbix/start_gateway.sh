#!/bin/bash

docker service create \
				--name zabbix-java-gateway \
				--hostname zabbix-java-gateway \
				--replicas 1 \
				--network swarm-net \
				--detach=true \
				--mount type=bind,source=/etc/localtime,target=/etc/localtime \
				zabbix/zabbix-java-gateway:latest
