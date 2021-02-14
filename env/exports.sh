#!/usr/bin/env bash

# Enable persistent REPL history for `node`.
# export NODE_REPL_HISTORY=~/.node_history;

# Allow 32³ entries; the default is 1000.
# export NODE_REPL_HISTORY_SIZE='32768';

# Use sloppy mode by default, matching web browsers.
# export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
yellow="#FFFF00"
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY;
GPG_TTY=$(tty);

# Dropbox folder
export DROPBOX_FOLDER=$HOME"/Dropbox"

# Dev Projects folder
export DEV_FOLDER=$DROPBOX_FOLDER"/Dev/";

# Current Dev Project folder
export CURRENT_DEV_PROJECT=$HOME"/Dev_Workspace/Current_Project/"

# Git repos folder
export GITHUB_FOLDER="$DEV/GitHub/";

# userpath
export PATH="$PATH:/Users/Mass/.local/bin";

# Find brew utilities in /user/local/sbin
export PATH="/usr/local/sbin:$PATH";

# Change default starship.toml file location with STARSHIP_CONFIG environment variable
export STARSHIP_CONFIG="$HOME/.starship";
