#/bin/bash

echo " # 기본 유틸 설치 "

apt-get install -y  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget \
xfsprogs ntfs-3g aptitude lvm2 dstat curl

sleep 20

echo " 파이선 설치 "

aptitude install -y python-dev

sleep 10 

echo " # 서버 시간 동기화. " 
rdate  -s  time.bora.net
hwclock --systohc  
date
hwclock
