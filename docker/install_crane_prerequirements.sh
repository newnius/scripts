#! /bin/bash


# enable docker remote api
bash -c cat > /etc/systemd/system/docker-tcp.socket <<EOL
[Unit]
Description=Docker Socket for the API  
[Socket]
ListenStream=2375  
BindIPv6Only=both  
Service=docker.service  
[Install]
WantedBy=sockets.target  
EOL

systemctl enable docker-tcp.socket

systemctl enable docker.socket

systemctl stop docker

systemctl start docker-tcp.socket

systemctl start docker


# install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# enable ntp service

apt install -y ntp ntpdate ntpstat
