#!/bin/bash

echo " # NVIDIA Driver 설치전 사전 작업 "

systemctl  get-default
systemctl  set-default  multi-user.target

lsmod  | grep  nouveau

echo  "
blacklist nouveau
options nouveau modeset=0
"   >> /etc/modprobe.d/blacklist.conf

cat  /etc/modprobe.d/blacklist.conf

update-initramfs -u
update-grub2

echo " # 사전작업 적용을 위한 재부팅 "

reboot
