#!/bin/bash

echo " # 데스크탑 GUI  Disable "

systemctl get-default

systemctl set-default multi-user.target

systemctl get-default

echo " # ubuntu desktop 설치 "

apt-get -y install ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
