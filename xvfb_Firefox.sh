#!/bin/bash
Xvfb :1 -screen 0 1024x768x16 &
/usr/bin/x11vnc -display :1.0 -usepw &
DISPLAY=:1.0
export DISPLAY
firefox
exit 0
