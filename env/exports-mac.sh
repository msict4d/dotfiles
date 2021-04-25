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

# Save private binaries path
export USER_PATH="$HOME/.local/bin";

# 2020-04-01
# Option 1 (uncomment to use): This will tell virtualenvwrapper to use the Homebrew installation of Python and
# virtualenv. If you do not specify VIRTUALENVWRAPPER_PYTHON and  
# VIRTUALENVWRAPPER_VIRTUALENV, you will need to install virtualenv and virtualenvwrapper
# in each environment you plan to invoke virtualenvwrapper commands (e.g. mkvirtualenv).

# init_virtualenvwrapper() { # modified 2021-03-07
#   export VENV_FOLDER=$DEV_WORKSPACE/Python/Virtualenvs/
#   export WORKON_HOME=$VENV_FOLDER/default
#   export PROJECT_HOME=$DROPBOX_FOLDER/Dev/Python/Projects
#   export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#   export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# }

# Option 2 (uncomment to use): Will use pyenv-virtualenvwrapper and pyenv-virtualenv if available
# or any other globally available version
init_virtualenvwrapper() { # modified 2021-04-01
  # set custom virtual environments location	
  export VENV_FOLDER=$DEV_WORKSPACE/Python/Virtualenvs/
  # set virtualenvwrapper env variables
  export WORKON_HOME=$VENV_FOLDER
  export PROJECT_HOME=$DROPBOX_FOLDER/Dev/Python/Projects
  export VIRTUALENVWRAPPER_PYTHON=$PYTHON
  export VIRTUALENVWRAPPER_VIRTUALENV=$VIRTUALENV
}