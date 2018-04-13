#! /bin/bash
# Note: In swarm mode, this will only stop current containers, but another container will be started instead. if you want to stop all swarm services use stop_all_services.sh

docker ps -a | sed -n '2,$p' | sed "s/ \+/ /g" | cut -f1 -d" "| xargs docker rm -f
