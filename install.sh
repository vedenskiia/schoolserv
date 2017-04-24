#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
============samba==========
cp /etc/samba/smb.conf{,.bak}
useradd teacher -m
passwd teacher
useradd admin sudo -m
passwd admin
smbpasswd -a teacher
smbpasswd -e teacher
smbpasswd -a admin
smbpasswd -e admin

