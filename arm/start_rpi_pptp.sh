#!/bin/bash

docker kill pptp
docker rm pptp

docker run \
	--name pptp \
	-d \
	--privileged \
	--restart always \
	--net=host \
	-e VPN_USER=USER \
	-e VPN_PASS=PASSWORD \
	negash/rpi-pptp-vpn
