#!/bin/bash

echo " # 부팅시 화면에 부팅로그 표시되도록 grub 수정 , 불필요한 ipv6를 비활성화 "
ip a | grep inet6



echo " # 설정 변경 "
cat /etc/default/grub | grep -v "#\|^$"

perl -pi -e 's/splash//' /etc/default/grub # 부팅시 화면에 부팅로그가 표시 되도록 rhgb 항목 지움
perl -pi -e 's/quiet//'  /etc/default/grub # 부팅시 화면에 부팅로그가 표시 되도록 quiet 항목 지움

echo " # ipv6 비활성 "
perl -pi -e  's/^GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="ipv6.disable=1 /'  /etc/default/grub

echo " # timeout 옵션 해제 "
perl -pi -e  's/^GRUB_HIDDEN_TIMEOUT=/#GRUB_HIDDEN_TIMEOUT=/'  /etc/default/grub

echo " # 변경 사항 확인 "
cat /etc/default/grub | grep -v "#\|^$" 

echo " # boot kernel 에 설정 적용 "
update-initramfs -u && update-grub2

echo " # 재부팅 "
reboot
