#! /bin/bash

docker service create \
--name site_phpredisadmin \
--network swarm-net \
-e REDIS_1_HOST=redis \
--publish 80:80 \
actency/docker-phpredisadmin
