#!/bin/bash

# for >= 17.10, start a global service
docker service create \
				--name zabbix-agent \
				--hostname="{{.Node.Hostname}}" \
				--network swarm-net \
				--detach=true \
				--env ZBX_HOSTNAME="{{.Node.Hostname}}" \
				--mode global\
				--env ZBX_SERVER_HOST=zabbix-server \
				--mount type=bind,source=/etc/localtime,target=/etc/localtime \
				zabbix/zabbix-agent:latest

exit

# for < 17.10, start one service per node
docker service create \
				--name zabbix-agent \
				--hostname zabbix-agent \
				--network swarm-net \
				--replicas 1 \
				--detach=true \
				--env ZBX_HOSTNAME=zabbix-agent \
				--env ZBX_SERVER_HOST=zabbix-server \
				--mount type=bind,source=/etc/localtime,target=/etc/localtime \
				zabbix/zabbix-agent:latest
