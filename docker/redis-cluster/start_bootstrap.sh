#! /bin/bash

docker service create \
--name redis-boot \
--mount type=bind,source=/mnt/data/redis-cluster/,target=/mnt/ \
--network swarm-net ruby sh -c '\
  gem install redis \
  && wget http://download.redis.io/redis-stable/src/redis-trib.rb \
  && sleep 3600'

