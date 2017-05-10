#!/bin/sh
apt update
apt upgrade
apt install samba -y
apt install squid -y
#============samba==========
echo "Настрока Samba"
cp /etc/samba/smb.conf{,.bak}
mkdir -p /var/lib/samba/usershare #Эта команда создает необходимый каталог 
again=y #присваиваем значение "yes" переменной again
while [ "$again" = "y" ] #Будем выполнять цикл, пока $again будет равно "yes"
do
echo "Please enter a name:"
  read name
  echo "The name you entered is $name"
    useradd $name -m
    passwd $name
    sudo usermod -G userFTP -a $name
    smbpasswd -a $name
    smbpasswd -e $name
    mkdir -p /var/lib/samba/usershare/$name  #Эта команда создает необходимый каталог
    sudo chown $name.userFTP /var/lib/samba/usershare/$name  #Эта команда задает права
    echo    "[$name]" >> /etc/samba/smb.conf
    echo    "comment = $name folder" >>  /etc/samba/smb.conf
    echo    "path = /var/lib/samba/usershare/$name" >> /etc/samba/smb.conf
    echo    "read only = no" >> /etc/samba/smb.conf
    echo    "locking = no" >> /etc/samba/smb.conf
    echo    "browsable = yes" >>  /etc/samba/smb.conf    # разрешить гостевой доступ
    echo    "guest ok = yes" >> /etc/samba/smb.conf
    echo    "admin users = $name" >> /etc/samba/smb.conf 
    echo    "read list = @userFTP" >> /etc/samba/smb.conf
    echo    " " >> /etc/samba/smb.conf
    echo "Do you wish to continue? (y/n): "
  read again
done
echo "continuum"
sudo restart smbd
sudo restart nmbd
#==============squid3============
echo "Настройка Squid3"
cp /etc/squid3/squid.conf /etc/squid3/squid.conf.original
chmod a-w /etc/squid3/squid.conf.original
cp /home/user/squid.conf  /etc/squid3/squid.conf
service squid3 restart
#==============
