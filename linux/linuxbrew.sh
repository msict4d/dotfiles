#!/usr/bin/env bash

# Install Homebrew (if not installed)
echo "Installing Homebrew."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH: (Only on Mac with ARM processors e.g M1)
# echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> /Users/mass/.zprofile
# eval $(/opt/homebrew/bin/brew shellenv)

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Binaries
brew install thefuck

# Python:
brew install python3
brew install pyenv # python version management
brew install pyenv-virtualenvwrapper # python dependencies management wrapper

# Remove outdated versions from the cellar.
brew cleanup
