#!/bin/bash

echo " # 기본 저장소 확인 "
cat /etc/apt/sources.list  |  grep -v "#\|^$"

echo " # Security 부분 변경 "
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

echo " # 변경 내용 확인 "
cat /etc/apt/sources.list  |  grep -v "#\|^$"

echo " # 적용 하기 "
apt-get update
