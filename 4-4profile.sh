#/bin/bash

# root 와 user 의 프롬프트 색상을 다르게 설정.

echo "export PS1='\[\e[1;46;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /root/.bashrc
tail -1 /root/.bashrc

logout

echo "export PS1='\[\e[1;47;30m\][\u@\h:\W]\\$\[\e[m\] '" >> /home/sonic/.bashrc
tail -1 /home/sonic/.bashrc
