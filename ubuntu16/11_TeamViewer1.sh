#!/bin/bash

echo " # 팀뷰어 실행 "

teamviewer daemon enable
sleep 5
teamviewer --daemon restart
sleep 10
teamviewer info
