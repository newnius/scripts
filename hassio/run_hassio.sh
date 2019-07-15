#!/bin/bash

docker run \
	--name hassio \
	-d \
	--net=host \
	--restart=always \
	-v /etc/localtime:/etc/localtime \
	-v /data/hassio:/config \
	homeassistant/home-assistant
