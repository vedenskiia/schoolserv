#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
============samba==========
cp /etc/samba/smb.conf{,.bak}
useradd teacher
passwd teacher
mkdir /home/teacher
useradd admin
passwd admin
mkdir /home/admin
