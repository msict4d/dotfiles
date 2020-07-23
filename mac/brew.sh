#!/usr/bin/env bash

# Install Homebrew (if not installed)
echo "Installing Homebrew."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install and setup Mongodb
# brew tap mongodb/brew
# brew install mongodb-community
# sudo mkdir -p /System/Volumes/Data/data/db
# sudo chown -R `id -un` /System/Volumes/Data/data/db

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed` as gsed
brew install gnu-sed

# Install `wget` with IRI support.
brew install wget #--with-iri # FIX 1 option generates error

brew install gmp
brew install grep
brew install node

# Install useful binaries.
brew install z
brew install ack
brew install autojump
brew install ffmpeg
brew install git
brew install git-lfs
brew install github/gh/gh
# brew install imagemagick --with-webp # FIX 2 option generates error
brew install p7zip
brew install pigz
brew install pv
brew install rsync
brew install rename
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install youtube-dl

# Installs Casks Fonts and preferred font
brew tap homebrew/cask-fonts
brew cask install font-fira-code

## Apps I use
brew cask install alfred
# brew cask install beamer
brew cask install dash
brew cask install dropbox
# brew cask install homebrew/cask-versions/firefox-nightly # Nightly
# brew cask install google-chrome #Chrome
# brew cask install homebrew/cask-versions/google-chrome-canary # Chrome Canary
brew cask install grammarly
brew cask install iterm2
# brew cask install kap
# brew cask install keycastr
# brew cask install mongodb-compass
# brew cask install notion
brew cask install sketch
brew cask install skitch
# brew cask install skype
brew cask install slack
brew cask install spotify
# brew cask install textexpander
# brew cask install tower

# Dev
brew cask install kite

# Remove outdated versions from the cellar.
brew cleanup
