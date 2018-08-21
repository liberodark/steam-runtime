#!/bin/bash
#
# About: Install Steam Runtime automatically
# Author: liberodark
# License: GNU GPLv3

# Check Software
which steam &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Steam is not Installed"
else
    echo "Steam is Installed"
    exit
fi

which wget &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error wget is not Installed"
    sudo apt-get install wget # Ubuntu / Debian
    sudo pacman -S wget # Manjaro / Arch Linux
    sudo yum install wget # OpenSuse / CentOS
    sudo dnf install wget # Fedora
    echo "wget is now Installed"
    exit
else
    echo "wget is Installed"
fi

which unzip &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error wget is not Installed"
    sudo apt-get install unzip # Ubuntu / Debian
    sudo pacman -S unzip # Manjaro / Arch Linux
    sudo yum install unzip # OpenSuse / CentOS
    sudo dnf install unzip # Fedora
    echo "unzip is now Installed"
    exit
else
    echo "unzip is Installed"
fi

# Download
wget https://github.com/liberodark/steam-runtime/archive/master.zip &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Error downloading master.zip"
else
    echo "Download Success Runtime"
fi

# Extract
unzip master.zip &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Runtime is not Extracted"
else
    echo "Runtime is Extracted"
fi

# Move to old
mv ~/.steam/bin32/steam-runtime ~/.steam/bin32/steam-runtime.old &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Old Runtime is not Saved or not Installed"
else
    echo "Old Runtime is saved"
fi

cd steam-runtime-master &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Enter is not Possible"
else
    echo "Enter is Possible"
fi

mkdir ~/.steam/bin32/steam-runtime &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Steam Runtime is not Installed"
else
    echo "Steam Runtime is Installed"
fi

mv * ~/.steam/bin32/steam-runtime &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Install is not Possible"
else
    echo "Install is done"
fi

# Up
cd .. &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Up is not Possible"
else
    echo "Up is OK"
fi

# Clean
rm -r master.zip steam-runtime-master/ &> /dev/null

if [[ "$?" != 0 ]]; then
    echo "Download is not Cleaned"
else
    echo "Download is Cleaned"
fi
