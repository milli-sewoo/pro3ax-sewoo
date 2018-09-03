#!/bin/bash

echo " # Ubuntu16 Dell Repository 등록 "

echo " http://linux.dell.com/repo/community/ubuntu/ "

echo 'deb http://linux.dell.com/repo/community/ubuntu xenial openmanage'  >  \
>  /etc/apt/sources.list.d/linux.dell.com.sources.list

echo " GPG Key Download "

wget http://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc

echo " GPG Key 등록 "

apt-key add  0x1285491434D8786F.asc

echo " update 이유는 srvadmin-all 을 설치하기 위하여 update 합니다. "

apt-get update

echo " srvadmin 설치 "

apt-get install -y srvadmin-all

echo " 방화벽 포트 확인 "

ufw status numbered

echo " OMSA 포트 1311 추가 후 적용 확인 "

ufw allow 1311/tcp

ufw status numbered

echo " 잘 설치 되었는지 확인 "

systemctl start dataeng
systemctl start dsm_om_connsvc

/opt/dell/srvadmin/sbin/racadm getsysinfo | grep "System Model\|Service Tag"
/opt/dell/srvadmin/sbin/omreport system alertlog | head

echo " 시스템이 시작될 때 관련 서비스가 실행 되도록 설정 "

systemctl enable dataeng
systemctl enable dsm_om_connsvc
