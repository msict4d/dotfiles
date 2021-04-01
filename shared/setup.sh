#!/bin/bash

# Update and upgrade apt
sudo apt update && sudo apt upgrade -y

# Install binaries via apt
source linux/apt.sh

# Set npm permissions and install npm binaries
source shared/npm.sh

# Create symlinks for dotfiles
source link-dotfiles.sh
