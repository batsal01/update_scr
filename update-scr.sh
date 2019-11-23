#!/bin/bash
# This is a simple update/install script for my Debian-based Linux distribution.
# You might want to change the script according to your necessity and drivers.

echo "And your username is:???"
read USERR
echo "
OK! 
Executing script...."

# Updating the system first
apt update && apt upgrade -yyq

# Installing Broadcom-STA-DKMS Wi-Fi driver(s)

apt install -y broadcom-sta-dkms && apt update

# Installing all the required packages....

apt install -y python3-setuptools python3-pip simplescreenrecorder git rsync vim john aircrack-ng nmap gdebi gparted htop grsync vlc gthumb synaptic gufw handbrake

# Installing .deb packages if available in the ~/Downloads directory of the username

if [ -d /home/$USERR/Downloads ]
then
	echo "Installing all the .deb packages...."
	pushd /home/$USERR/Downloads
	for DEBBS in ./*.deb
	do
		gdebi -n "$DEBBS"
	done
	popd
else
	echo ""
	echo "There is no packages in the ~/Downloads directory."
	echo ""
fi

# Rebooting the system

echo "
Everything is done. Rebooting now...."
apt clean && apt autoclean && apt autoremove -y
/sbin/init 6
