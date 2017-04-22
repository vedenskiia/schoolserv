#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
============samba==========
sudo cp /etc/samba/smb.conf{,.bak}
