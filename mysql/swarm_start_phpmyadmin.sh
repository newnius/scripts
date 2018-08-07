#! /bin/bash

docker service create \
	--name phpmyadmin \
	--hostname phpmyadmin \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 8081:80 \
	--env PMA_HOST=mysql \
	--env PMA_PORT=3306 \
	phpmyadmin/phpmyadmin
