#! /bin/bash

docker service create \
	--name cloud \
	--hostname cloud \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,src=/etc/localtime,dst=/etc/localtime,readonly \
	--mount type=bind,src=/data/cloud/webroot/,dst=/var/www/html/ \
	--mount type=bind,src=/data/cloud/logs/,dst=/var/log/apache2 \
	nextcloud
