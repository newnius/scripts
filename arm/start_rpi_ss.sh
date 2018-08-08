#! /bin/bash

docker kill ss
docker rm ss

docker run \
	-d \
	--restart always \
	--publish 127.0.0.1:1080:1080 \
	--name ss \
	newnius/rpi-shadowsocks \
	ssserver -p 1080 -k PASSWORD -m aes-256-cfb
