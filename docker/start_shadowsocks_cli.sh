#! /bin/bash

docker service create \
--name proxy_shadowsocks \
--publish 1080:1080 \
mritd/shadowsocks -m "ss-local" -s "-s SERVER -p 8844 -b 0.0.0 -l 1080 -k PASSWORD -m aes-256-cfb"
