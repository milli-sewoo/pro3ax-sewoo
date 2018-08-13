#/bin/bash

# 히스토리 출력시 날짜가 표시 되도록 변경
echo " "  >> /etc/profile
echo "# Add timestamp to .bash_history "  >> /etc/profile
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile
echo " "  >> /etc/profile
