#!/usr/bin/env bash

echo "auto-update-downloader - Downloads updates and make updating quicker"
echo "Source code and info: https://github.com/daniel071/auto-update-downloader"

read -p "Install? (y/N) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	# Make directory, git clone to directory
	mkdir ~/.auto-update-downloader/
	git clone https://github.com/daniel071/auto-update-downloader.git ~/.auto-update-downloader/

	# Make backup of profile file
	cp ~/.profile ./profile_backup

	# Add to auto start up
	echo "~/.auto-update-downloader/src/main.sh" >> ~/.profile

	# epic, it is done
	echo -e "\033[1;32mInstallation was successfull! \033[0m"
fi
