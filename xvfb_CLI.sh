#!/bin/bash
x11vnc -create -env FD_PROG=/usr/bin/fluxbox \
  -env X11VNC_FINDDISPLAY_ALWAYS_FAILS=1 \
  -env X11VNC_CREATE_GEOM=${1:-1440x900x16} \
  -gone 'killall Xvfb' \
  -bg -nopw
exit 0
