#!/bin/bash

echo " RAID 컨트롤러 관리 프로그램을 통해 서버의 전원을 끄지 않고 디스크 장애를 처리하거나 RAID 구성을 변경할 수 있습니다. "

mkdir /root/raid_manager
cd /root/raid_manager/
wget https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/17.05.00.02_Linux-64_MSM.gz

tar xvzf 17.05.00.02_Linux-64_MSM.gz

cd disk/

apt-get install -y alien

COUNTER=10

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 10

alien --scripts *.rpm

COUNTER=10

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 10

dpkg --install lib-utils2_1.00-9_all.deb

dpkg --install megaraid-storage-manager_17.05.00-3_all.deb

systemctl start vivaldiframeworkd.service
systemctl enable vivaldiframeworkd.service

echo " Test 를 위하여 사용자 계정으로 로그아웃 후 "

echo " /usr/local/MegaRAID\ Storage\ Manager/startupui.sh & "
