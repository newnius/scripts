#! /bin/bash

docker service create \
	--name nginx \
	--hostname nginx \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish mode=host,published=80,target=80 \
	--publish mode=host,published=443,target=443 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/data/nginx/nginx.conf,dst=/etc/nginx/nginx.conf,readonly \
	--mount type=bind,src=/data/nginx/conf.d,dst=/etc/nginx/conf.d,readonly \
	--mount type=bind,src=/data/ssl/,dst=/etc/letsencrypt/,readonly \
	--mount type=bind,src=/data/nginx/logs,dst=/etc/nginx/logs \
	nginx
