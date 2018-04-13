#! /bin/bash

docker service create \
	--name port-forward \
	--publish 81:80 \
	--ENV REMOTE_HOST=example.com \
	--ENV REMOTE_PORT=81 \
	marcnuri/port-forward
