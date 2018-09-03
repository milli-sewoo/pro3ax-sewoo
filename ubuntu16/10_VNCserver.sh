#!/bin/bash

dpkg --list | grep vnc  # 현재 설치된 vnc 패키지 확인

echo " # vnc server(tigervnc-server) 와 vnc viewer 를 설치 합니다. "

apt-get -y install xfce4 xfce4-goodies tightvncserver

COUNTER=10

until [  $COUNTER -lt 1 ]; do

      echo COUNTER $COUNTER

      let COUNTER-=1

done

sleep 10

echo " # VNC 연결을 위한 방화벽 (Firewall 설정) "

ufw status

ufw allow 5901/tcp
ufw allow 5902/tcp

ufw status

echo " # VNC 암호 설정 (일반 사용자 계정으로 전환한 후) "

su - sonic

# vnc접속용 암호를 지정합니다.
