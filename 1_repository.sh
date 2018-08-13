#bin/bash

# 기본 저장소 확인
cat /etc/apt/sources.list  |  grep -v "#\|^$"

# Security 부분 변경
perl -pi -e 's/security.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

# 변경 내용 확인
cat /etc/apt/sources.list  |  grep -v "#\|^$"

# 적용 하기
apt-get update
