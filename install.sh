#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
============samba==========
cp /etc/samba/smb.conf{,.bak}
useradd teacher -m
passwd teacher
useradd admin -m
passwd admin

