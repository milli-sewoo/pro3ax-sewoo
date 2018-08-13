#/bin/bash

# 히스토리 사이즈 변경 (1000개 -> 100,000개)
echo $HISTSIZE
grep HISTSIZE /etc/skel/.bashrc
perl -pi -e 's/HISTSIZE=1000/HISTSIZE=100000/'   /etc/skel/.bashrc
grep HISTSIZE /etc/skel/.bashrc

grep HISTSIZE .bashrc
perl -pi -e 's/HISTSIZE=1000/HISTSIZE=100000/'   ~/.bashrc
grep HISTSIZE .bashrc
