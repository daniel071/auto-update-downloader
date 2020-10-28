#!/bin/bash

if [ $(dunstify -A yes,Yes -A no,No "Download updates?" "In order to help you update faster") = "yes" ]
then
	pkexec pacman -Syuw 
	notify-send "Downloading Complete!" "Use pacman -Su to update your system"  
fi

