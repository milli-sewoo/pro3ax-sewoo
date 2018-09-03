#!/bin/bash

cat /etc/ssh/banner.sample

grep Banner /etc/ssh/sshd_config
echo "Banner /etc/ssh/banner.sample" >> /etc/ssh/sshd_config
grep Banner /etc/ssh/sshd_config

systemctl restart sshd
