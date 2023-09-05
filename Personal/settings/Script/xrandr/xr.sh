#!/bin/bash

if [ $# -eq 0 ]; then
	echo -e "\n$(tput setaf 1)-------------------------------------------------\nNeed argument (home or work)\n-------------------------------------------------
	$(tput sgr 0)\n"
	exit
fi

place=$1

if [ $place == 'home' ]; then
	xrandr --output eDP-1 --off --output DP-2-2 --primary --mode 2560x1440 --pos 2560x0 --rotate normal --output DP-2-1 --mode 2560x1440 --pos 0x0 --rotate normal
elif [ $place == 'work' ]; then	
	xrandr --output eDP-1 --off --output DP-2-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output DP-2-2 --mode 2560x1440 --pos 2560x0 --rotate normal
elif [ $place == 'away' ]; then
	xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-2-1 --off --output DP-2-2 --off
else
	echo -e "\n$(tput setaf 1)-------------------------------------------------\nNeed argument (home or work or away)\n-------------------------------------------------
	$(tput sgr 0)\n\n  Example: xr home\n"
	echo -e 
fi

