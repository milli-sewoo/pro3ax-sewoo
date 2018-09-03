#!/bin/bash

echo " # 기본 정책을 차단 (deny) 로 변경한 후 포트 (또는 서비스) 만 허용 "

ufw status
ufw default deny
ufw allow 7777/tcp
ufw allow 22/tcp

ufw status numbered

echo " # sshd 설정. (기본 포트인 22번을 7777로 변경) "

#Ubuntu16 sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config
perl -pi -e "s/Port 22/Port 7777/g" /etc/ssh/sshd_config
perl -pi -e "s/PermitRootLogin prohibit-password/PermitRootLogin no/g" /etc/ssh/sshd_config
grep 'Root\|Port' /etc/ssh/sshd_config

echo " # X11Forwarding 을 위해 AddressFamily inet 을 추가 합니다. "

echo "AddressFamily inet" >> /etc/ssh/sshd_config
grep AddressFamily /etc/ssh/sshd_config

systemctl restart sshd
