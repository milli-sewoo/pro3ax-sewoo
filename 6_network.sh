#!/bin/bash

ip a

EXT_NIC=$(ip a | grep 'state UP' | cut -d ":" -f 2)

echo " # 추출된 인터페이스 명이 맞는지 확인 필요 "

echo ${EXT_NIC}

ifconfig  ${EXT_NIC}

cat /etc/network/interfaces

cat /etc/hostname

cat /etc/resolv.conf

ping -c 4 google.com
