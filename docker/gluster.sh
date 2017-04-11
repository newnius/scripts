gluster peer probe 192.168.1.221
gluster peer probe 192.168.1.222
gluster peer probe 192.168.1.223
gluster peer probe 192.168.1.224
gluster peer probe 192.168.1.225
gluster peer probe 192.168.1.226

gluster volume create data replica 3 192.168.1.221:/data/data 192.168.1.222:/data/data 192.168.1.223:/data/data 192.168.1.224:/data/data 192.168.1.225:/data/data 192.168.1.226:/data/data

gluster volume start data
