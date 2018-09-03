#!/bin/bash

mv .vnc/xstartup .vnc/xstartup.bak
echo '#!/bin/bash  ' > .vnc/xstartup
echo 'xrdb $HOME/.Xresources  ' >> .vnc/xstartup
echo 'startxfce4 &  ' >> .vnc/xstartup
cat .vnc/xstartup
chmod +x .vnc/xstartup

vncserver

vncserver -kill :1
