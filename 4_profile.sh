#!/bin/bash

echo " # 기본 alias "

echo " "  >> /etc/profile
echo "# add by dasandata"             >>   /etc/profile
echo "alias vi='vim' "                        >>   /etc/profile
echo "alias ls='ls --color=auto' "       >>   /etc/profile
echo "alias ll='ls -lh' "                        >>   /etc/profile
echo "alias grep='grep --color=auto' "   >>   /etc/profile


echo " # 히스토리 사이즈 변경 (1000개 -> 100,000개 ) "

echoecho  $HISTSIZE$HISTSIZE
grep HISTSIZE /etc/skel/.bashrc
perl -pi -e  grep HISTSIZE /etc/skel/.bashrc  's/HISTSIZE=1000/HISTSIZE=100000/'   /etc/skel/.bashrc
grep HISTSIZE /etc/skel/.bashrc

grep HISTSIZE .bashrc
perl -pi -e 's/HISTSIZE=1000/HISTSIZE=100000/'   ~/.bashrc
grep HISTSIZE .bashrc


echo " 히스토리 출력 날짜가 표시 되도록 변경 "

echo " "  >> /etc/profile
echo "# Add timestamp to .bash_history "  >> /etc/profile
echo 'export HISTTIMEFORMAT="20%y/%m/%d %T "' >> /etc/profile
echo " "  >> /etc/profile


echo " root 와 user 의 프롬프트 색상을 다르게 설정. "

echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
tail -1 /root/.bashrc

echo " root    /   로그아웃 "

logout

echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc
tail -1 /home/sonic/.bashrc

echo " # 적용확인. "

tail -10 /etc/profile

source  /etc/profile

source  .bashrc

echo $HISTSIZE
