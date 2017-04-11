#! /bin/bash

echo "PASSWORD" | sudo -S true


#### mount nfs ####
sudo apt-get install -y nfs-common
sudo mkdir /mnt/nfs || sudo umount /mnt/nfs
sudo mount -t nfs 192.168.1.100:/Docker /mnt/nfs && sudo chmod 777 /mnt/nfs


#### mount gluster ####
sudo apt-get install -y glusterfs-client
sudo umount /mnt/data || sudo mkdir /mnt/data
sudo umount /mnt/share || sudo mkdir /mnt/share
sudo mount -t glusterfs 192.168.1.221:/data /mnt/data  && sudo chmod 777 /mnt/data
sudo mount -t glusterfs 192.168.1.221:/share /mnt/share  && sudo chmod 777 /mnt/share
