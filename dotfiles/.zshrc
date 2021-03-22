# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="agnoster"

# Plugins
# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
export MACHINE

# Set Dropbox and Dev Workspace folders (Mac)
export HOSTNAME="$(hostname)"

if [[ "$HOSTNAME" == "dacomp5" ]]
then
    # Dropbox folder
    export DROPBOX_FOLDER="/Volumes/Data/Dropbox/";
    # Dev Workspace folder for dev envs
    export DEV_WORKSPACE="/Volumes/Data/Dev_Workspace/"
else
    # Dropbox folder
    export DROPBOX_FOLDER=$HOME"/Dropbox/";
    # Dev Workspace folder for dev envs
    export DEV_WORKSPACE=$HOME"/Dev_workspace/"; 
fi

# Source aliases
# For a full list of active aliases, run `alias`.
if [[ "$MACHINE" == "Linux" ]];then
  PROJECT_ROOT='/mnt/c/Users/Mass/Dev/GitHub/dotfiles'
  source "$PROJECT_ROOT/env/aliases-shared.sh"
  source "$PROJECT_ROOT/env/aliases-linux.sh"
  source "$PROJECT_ROOT/env/exports.sh"
  source "$PROJECT_ROOT/env/functions.sh"
elif [[ "$MACHINE" == "Mac" ]]; then
  PROJECT_ROOT=$DROPBOX_FOLDER"/Dev/GitHub/dotfiles"
  source "$PROJECT_ROOT/env/aliases-shared.sh"
  source "$PROJECT_ROOT/env/aliases-mac.sh"
  source "$PROJECT_ROOT/env/exports.sh"
  source "$PROJECT_ROOT/env/functions.sh"
fi

# z - Fast navigation, see [this gist](https://gist.github.com/mischah/8149239)

if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Python:

# 2020-07-24
# ---
# virtualenvwrapper
# --

# Option 1 (uncomment to use): This will tell virtualenvwrapper to use the Homebrew installation of Python and
# virtualenv. If you do not specify VIRTUALENVWRAPPER_PYTHON and  
# VIRTUALENVWRAPPER_VIRTUALENV, you will need to install virtualenv and virtualenvwrapper
# in each environment you plan to invoke virtualenvwrapper commands (e.g. mkvirtualenv).


init_virtualenvwrapper() { # modified 2021-03-07
  export VENV_FOLDER=$DEV_WORKSPACE/Python/Virtualenvs/
  export WORKON_HOME=$VENV_FOLDER/default
  export PROJECT_HOME=$DROPBOX_FOLDER/Dev/Python/Projects
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
}

init_virtualenvwrapper

source "/usr/local/bin/virtualenvwrapper.sh"

# Option 2: Use pyenv and pyenv-virtualenvwrapper

# set up pyenv #
# --
# Commenting out `eval "$(pyenv init -)"` and python related functions in 'env/functions.sh'
# file should revert the system back to the system-wide installation of Python installed 
# via Homebrew.

eval "$(pyenv init -)"

# default to latest Python 3 installed with Homebrew
# python3.latest

# WTF, I just discovered this
eval $(thefuck --alias)

# Starship command prompt
eval "$(starship init zsh)"

# Anaconda3
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fix Path to preferred order
export PATH="/Users/mass/.pyenv/shims:/usr/local/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/Mass/.local/bin"

# Ruby
export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH" # binaries installed by homebrew gem
export PATH="/usr/local/opt/ruby/bin:$PATH" # homebrew ruby

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh