#!/usr/bin/env bash

# Check if the connection is metered - Don't download updates on metered connections
# https://developer.gnome.org/NetworkManager/stable/nm-dbus-types.html#NMMetered
if [ "$(busctl get-property org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.NetworkManager Metered)" != "u 1" ]; then
	# Ask user in notification
	if [ $(dunstify -A yes,Yes -A no,No "Download updates?" "In order to help you update faster") = "yes" ]; then
		# Run update command as root
		pkexec pacman -Syuw
		# Notify user
		notify-send "Downloading Complete!" "Use pacman -Su to update your system"
	fi
else
	echo "Metered network detected, exiting"
fi
