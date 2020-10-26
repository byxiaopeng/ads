#!/bin/bash
#下载rclone核心程序
rm -r /usr/bin/rcgd
wget -P /usr/bin https://gd.cnm.workers.dev/amd64/rcgd
#设置运行权限
chmod +x /usr/bin/rcgd
#下载aria2c核心程序
rm -r /usr/bin/aria2c
wget https://github.com/P3TERX/aria2-builder/releases/download/1.35.0_2020.09.04/aria2-1.35.0-static-linux-amd64.tar.gz
tar -zxvf aria2-1.35.0-static-linux-amd64.tar.gz
mv aria2 /usr/bin/aria2
chmod +x /usr/bin/aria2c
#设置运行权限
rm -rf /root/.aria2
mkdir /root/.aria2
#下载配置文件
wget -P /root/.aria2 http://dmxz2.us-south.cf.appdomain.cloud/aria2/autoupload.sh
chmod +x /root/.aria2/autoupload.sh
wget -P /root/.aria2 https://p3terx.github.io/aria2.conf/delete.aria2.sh
chmod +x /root/.aria2/delete.aria2.sh
wget -P /root/.aria2 https://p3terx.github.io/aria2.conf/delete.sh
chmod +x /root/.aria2/delete.sh

wget -P /root/.aria2 https://p3terx.github.io/aria2.conf/info.sh
chmod +x /root/.aria2/info.sh


wget -P /root/.aria2 https://p3terx.github.io/aria2.conf/dht6.dat
wget -P /root/.aria2 https://p3terx.github.io/aria2.conf/dht.dat
wget -P /root/.aria2 http://dmxz2.us-south.cf.appdomain.cloud/aria2/aria2.conf

touch /root/.aria2/aria2.session
touch /root/.aria2/aria2.log
#下载rclone挂载的配置文件（自己设置）
wget -P /root http://dmxz2.us-south.cf.appdomain.cloud/aria2/2121.conf
mv /root/2121.conf /root/.rclone.conf
#后台运行
aria2c --conf-path="/root/.aria2/aria2.conf" -D

nohup /v2ray/v2ray -config=/v2ray/config.json >out.txt 2>&1 &