#/bin/bash

echo " # 기본 유틸 설치. "

apt-get install -y  \
vim nfs-common rdate xauth firefox gcc make locate htop tmux git wget ipmitool \
xfsprogs ntfs-3g aptitude lvm2 dstat curl 

COUNTER=100

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

aptitude install -y python-dev 

COUNTER=50

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

echo " # 서버 시간 동기화. "

rdate  -s  time.bora.net
hwclock --systohc  
date
hwclock
