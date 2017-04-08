#! /bin/bash

docker service create \
--replicas 1 \
--name nginx \
--network swarm-net \
--publish mode=host,published=80,target=80 \
--mount type=bind,src=/mnt/data/nginx/nginx.conf,dst=/etc/nginx/nginx.conf,readonly \
--mount type=bind,src=/mnt/data/nginx/conf.d,dst=/etc/nginx/conf.d,readonly \
nginx
