#!/bin/bash

docker service create \
--name lantern \
--network swarm-net \
--publish 3128:3128 \
newnius/lantern
