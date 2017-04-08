#! /bin/bash

#if you want to use sudo next, uncomment this line below
echo "123456" | sudo -S true


#date -R
#sudo unlink /etc/localtime 
#sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#date -R

#sudo mv /home/test/rc.local /etc/rc.local

#### install docker
#sudo -- sh -c 'curl -sSL https://get.docker.com | sh'
#sudo usermod -aG docker $USER

### upgrade docker
#sudo -- sh -c 'curl -sSL https://get.docker.com | sh'
#docker version
sudo reboot

#sudo bash /mnt/Docker/scripts/install_crane_prerequirements.sh

#sudo rm -rf /var/gluster/data/data
#sudo mkdir /var/gluster/data/data
#sudo rm -rf /var/gluster/data/share
#sudo mkdir /var/gluster/data/share

#last
