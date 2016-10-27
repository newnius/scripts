#! /bin/bash

sudo apt-get install -y nfs-common

sudo mkdir /mnt/Temp
sudo umount /mnt/Temp

sudo mount -t nfs 192.168.1.100:/Temp    /mnt/Temp && sudo chmod 777 /mnt/Temp
