#!/bin/bash

vncserver -kill :1

cat .vnc/xstartup

cp .vnc/xstartup .vnc/xstartup.bak
echo 'gnome-panel &  ' >> .vnc/xstartup
echo 'gnome-settings-daemon & ' >> .vnc/xstartup
echo 'metacity &  ' >> .vnc/xstartup
echo 'nautilus &  ' >> .vnc/xstartup

cat .vnc/xstartup
chmod +x .vnc/xstartup

vncserver

vncserver -kill :1
