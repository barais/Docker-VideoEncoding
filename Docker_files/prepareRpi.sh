#!/bin/bash

sed -i "s/raspberrypi/$1/g" /etc/hostname
sed -i "s/raspberrypi/$1/g" /etc/hosts
/etc/init.d/hostname.sh

curl -s https://packagecloud.io/install/repositories/Hypriot/Schatzkiste/script.deb.sh | bash
apt-get install -y docker-hypriot git 
systemctl enable docker

usermod -a -G docker pi

wget https://bfb87ab16c3c18c716b289fef83f99937c01c202.googledrive.com/host/0B3yka9lv3tmsT0M2Y3Q2aVV2cHc/docker-volume-glusterfs -P /usr/local/bin
wget https://bfb87ab16c3c18c716b289fef83f99937c01c202.googledrive.com/host/0B3yka9lv3tmsT0M2Y3Q2aVV2cHc/swarm -P /usr/local/bin
chmod 755 /usr/local/bin/docker-volume-glusterfs
chmod 755 /usr/local/bin/swarm

reboot