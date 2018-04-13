#!/bin/bash

docker kill port-forward
docker rm port-forward

docker run \
	--name port-forward \
	-d \
	--restart always \
	--publish 81:80 \
	-e REMOTE_HOST=example.com \
	-e REMOTE_PORT=82 \
	newnius/rpi-port-forward
