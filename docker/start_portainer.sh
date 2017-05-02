#! /bin/bash

docker service create \
--name portainer \
--publish 9000:9000 \
--mount type=bind,source=/mnt/data/portainer/data,target=/data \
portainer/portainer
