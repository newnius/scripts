# Deploy Gluster cluster with docker

## Start gluster on all nodes

```
./start_gluster.sh
```

## Setup (on one of the nodes)

```bash
gluster peer probe 192.168.1.221
gluster peer probe 192.168.1.222
gluster peer probe 192.168.1.223
gluster peer probe 192.168.1.224
gluster peer probe 192.168.1.225
gluster peer probe 192.168.1.226
```

## Create volume (on one of the nodes)

```bash
gluster volume create volume1 replica 3 192.168.1.221:/data/data 192.168.1.222:/data/data 192.168.1.223:/data/data 192.168.1.224:/data/data 192.168.1.225:/data/data 192.168.1.226:/data/data
```

## Active the volume

```bash
gluster volume start volume1
```

## Mount on the host machine

```bash
# install necessary drive
sudo apt install -y glusterfs-client
```

```bash
test ! -d /mnt/volume1 && mkdir /mnt/volume1

mount -t glusterfs 127.0.0.1:/volume1 /mnt/volume1

cgmod -R 777 /mnt/volume1
```
