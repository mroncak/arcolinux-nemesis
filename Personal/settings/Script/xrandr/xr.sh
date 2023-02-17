#!/bin/bash

if [ $# -eq 0 ]; then
	echo -e "\n$(tput setaf 1)-------------------------------------------------\nNeed argument (home or work)\n-------------------------------------------------
	$(tput sgr 0)\n"
	exit
fi

place=$1

if [ $place == 'home' ]; then
	xrandr --output DP-2-2 --primary --right-of DP-2-1
elif [ $place == 'work' ]; then	
	xrandr --output DP-2-1 --primary --left-of DP-2-2
else
	echo -e "\n$(tput setaf 1)-------------------------------------------------\nNeed argument (home or work)\n-------------------------------------------------
	$(tput sgr 0)\n"
	echo -e 
fi

