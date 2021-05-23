#!/bin/bash

# Save which python
export PYTHON=$(which python3)

#Save Homebrew Python3
export HOMEBREW_PYTHON=$brew_prefix"/bin/python3"

# Save which virtualenv
export VIRTUALENV=$(which virtualenv)

#Save Homebrew virtualenv
export HOMEBREW_VIRTUALENV=$brew_prefix"/bin/virtualenv"

# Current Dev Project folder
export CURRENT_DEV_PROJECT=$DEV_WORKSPACE"/Current_Project/";

# Set the default editor
export EDITOR=nano
alias nano='edit'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
