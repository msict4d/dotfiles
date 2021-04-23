#!/bin/bash

# Update and upgrade apt
sudo apt update && sudo apt upgrade -y

# Install binaries via apt
echo "===================="
echo "Running linux/apt.sh"
echo "====================\n"

source linux/apt.sh

echo "===================="
echo "Done running linux/apt.sh"
echo "====================\n"

# Set npm permissions and install npm binaries
echo "===================="
echo "Running shared/npm.sh"
echo "====================\n"

source shared/npm.sh

echo "===================="
echo "Done running shared/npm.sh"
echo "====================\n"

# Create symlinks for dotfiles
echo "===================="
echo "Linking dotfiles"
echo "====================\n"

source link-dotfiles.sh

# Install apps and binaries with Brew
echo "===================="
echo "Running linux/linuxbrew.sh"
echo "====================\n"

source linux/linuxbrew.sh

echo "===================="
echo "Done running linux/linuxbrew.sh"
echo "====================\n"

echo "===================="
echo "Setup is done!"
echo "====================\n"