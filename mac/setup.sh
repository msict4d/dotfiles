#!/usr/bin/env bash

# Install apps and binaries with Brew
echo "===================="
echo "Running mac/brew.sh"
echo "===================="

source mac/brew.sh

echo "===================="
echo "Done running mac/brew.sh"
echo "===================="

# Set npm permissions and install global binaries
echo "===================="
echo "Running shared/npm.sh"
echo "===================="

source shared/npm.sh

echo "===================="
echo "Done running shared/npm.sh"
echo "===================="

# Create symlinks for dotfiles
echo "===================="
echo "Linking dotfiles"
echo "===================="

source link-dotfiles.sh

# Configure MacOS defaults.
# You only want to run this once during setup. Additional runs may reset changes you make manually.
echo "===================="
echo "Configuring MAC OS settings"
echo "===================="

source mac/macos

echo "===================="
echo "Installing gems"
echo "===================="

source mac/iterm/gem

echo "===================="
echo "Setup is done!"
echo "===================="



