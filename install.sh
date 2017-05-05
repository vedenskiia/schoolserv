#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
============samba==========
cp /etc/samba/smb.conf{,.bak}
useradd teacher -m
passwd teacher
usermod -G adminFTP -a admin
useradd admin -m
passwd admin
sudo usermod -G userFTP -a teacher
smbpasswd -a teacher
smbpasswd -e teacher
smbpasswd -a admin
smbpasswd -e admin
service smbd restart
==============squid3============
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
chmod a-w /etc/squid3/squid.conf.original
service squid3 restart
==============
