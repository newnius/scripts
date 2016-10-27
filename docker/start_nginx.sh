
docker service create \
--replicas 1 \
--name nginx \
--network my-network \
-p 80:80 \
--mount type=bind,src=/mnt/Data/nginx.conf,dst=/etc/nginx/nginx.conf,readonly \
nginx

