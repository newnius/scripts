#! /bin/bash

docker kill ss_cli
docker rm ss_cli

docker run \
	-d \
	--restart always \
	--publish 127.0.0.1:1080:1080 \
	--name ss_cli \
	newnius/rpi-shadowsocks \
	sslocal -s 8.8.8.8 -p 1082 -k PASSWORD -b 0.0.0.0 -l 1080 -m aes-256-cfb
