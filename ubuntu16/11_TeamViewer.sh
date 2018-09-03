#!/bin/bash

echo " # Teamviewer install "

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

apt-get -y install ./teamviewer_amd64.deb

echo " # Teamviewer Passwd 설정 "
