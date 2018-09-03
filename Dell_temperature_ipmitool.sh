#!/bin/bash

echo " 서버에 내장된 관리기능 (ipmi) 를 이용하여 온도를 모니터링 하고 이메일로 받아봅니다. "

echo " 파일 복사. "
cp /root/pro3ax-sewoo/usr-local-sbin-source/ipmi_temperature_check_log.sh /usr/local/sbin
cp /root/pro3ax-sewoo/usr-local-sbin-source/ipmi_temperature_log_mail.sh /usr/local/sbin

echo " 파일 권한 변경 ( 실행 ) "
chmod 744 /usr/local/sbin/ipmi_temperature_check_log.sh
chmod 744 /usr/local/sbin/ipmi_temperature_log_mail.sh

echo " 테스트 "

source /usr/local/sbin/mail_export_global_variable_mail.sh
TITLE='IPMI_Temperature_log_by_'${TITLE_TAIL}
LOG='/var/log/Dasandata_Temperature.log'

echo  "
##################################################
# This Message from ${TITLE_TAIL}
# Using crontab (/etc/crontab)
# The location of the configuration file is below.
# /usr/local/sbin/mail_export_global_variable_mail.sh,
# /usr/local/sbin/ipmi_temperature_check_log.sh,
# /usr/local/sbin/ipmi_temperature_log_mail.sh
##################################################
" >> ${LOG}

/usr/local/sbin/ipmi_temperature_check_log.sh
sleep 10
/usr/local/sbin/ipmi_temperature_check_log.sh
sleep 10
/usr/local/sbin/ipmi_temperature_log_mail.sh

echo " crontab 에 등록 "

cat /etc/crontab

echo "
# 매시 30분에 온도체크 로그생성
30 * * * * root /usr/local/sbin/ipmi_temperature_check_log.sh
# 매일 오전 8시에 온도체크 로그 발송
0   8  * * * root /usr/local/sbin/ipmi_temperature_log_mail.sh
" >> /etc/crontab

cat /etc/crontab
