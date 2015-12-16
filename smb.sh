#!/bin/bash

cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
mkdir /home/public
chmod 777 /home/public
useradd publicuser
smbpasswd -a publicuser

echo [Share]>>/etc/samba/smb.conf
echo -e "\tcomment = Shared folder with username and password" >> /etc/samba/smb.conf
echo -e "\tpath = /home/public" >> /etc/samba/smb.conf
echo -e "\tpublic = yes" >> /etc/samba/smb.conf
echo -e "\twritable = yes" >> /etc/samba/smb.conf
echo -e "\tvalid users = Publicuser" >> /etc/samba/smb.conf
echo -e "\tcreate mask = 0777" >> /etc/samba/smb.conf
echo -e "\tdirectory mask =0777" >> /etc/samba/smb.conf
echo -e "\tforce user = nobody" >> /etc/samba/smb.conf
echo -e "\tforce group = nogroup" >> /etc/samba/smb.conf
echo -e "\tavailable = yes" >> /etc/samba/smb.conf
echo -e "\tbrowseable = yes" >> /etc/samba/smab.conf

service smbd restart

