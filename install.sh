#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
#============samba==========
echo "Настрока Samba"
cp /etc/samba/smb.conf{,.bak}
echo -n "Введите имя пользователя "
read name
useradd $name -m
passwd $name
sudo usermod -G userFTP -a $name
smbpasswd -a $name
smbpasswd -e $name
service smbd restart
#==============squid3============
echo "Настройка Squid3"
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
chmod a-w /etc/squid3/squid.conf.original
cp /home/user/squid.conf  /etc/squid3/squid.conf
service squid3 restart
#==============
