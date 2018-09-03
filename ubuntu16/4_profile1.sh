#!/bin/bash

echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc
tail -1 /home/sonic/.bashrc

echo " # 적용확인. "

tail -10 /etc/profile

source  /etc/profile

source  .bashrc

echo $HISTSIZE
