#! /bin/bash

docker service create \
	--name ui_adminmongo \
	--hostname ui_adminmongo \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env HOST=mongodb \
	--env PORT=1234 \
	--publish 1234:1234 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/mongo/config,target=/app/config \
	adicom/admin-mongo
