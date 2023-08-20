#!/bin/sh

# Place your vsync backend here (xpresent for amd, glx nvidia usually)
BACKEND=xpresent

CURRENT_BACKEND=$(xfconf-query -c xfwm4 -p /general/vblank_mode)


if [ $CURRENT_BACKEND == off ]; then
	xfconf-query -c xfwm4 -p /general/vblank_mode -s $BACKEND
	xfwm4 --replace --vblank $BACKEND &
	notify-send "VSync enabled!"
else
	xfconf-query -c xfwm4 -p /general/vblank_mode -s off
	xfwm4 --replace --vblank off &
	notify-send "VSync disabled!"
fi

exit