#! /bin/bash

docker service create \
--name site_adminmongo \
--detach=true \
--network swarm-net \
-e HOST=mongo \
-e PORT=1234 \
--mount type=bind,source=/mnt/data/mongo-config,target=/app/config \
--publish 1234:1234 \
adicom/admin-mongo
