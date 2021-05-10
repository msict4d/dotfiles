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

# Source shared .bash and .zshconfiguration (.rc)
source $HOME/.init

# Fix Path to preferred order on MAC
if [[ "$MACHINE" == "Mac" ]];then
    # Starship command prompt
    # Change default starship.toml file location with STARSHIP_CONFIG environment variable
    export STARSHIP_CONFIG="$HOME/.starship";
    eval "$(starship init zsh)"
    
    # userpath
    export PATH="$USER_PATH:$PATH";

    # Find brew utilities in /user/local/sbin
    export PATH="/usr/local/sbin:$PATH";
    
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

    # Fix path to preferred order 
    export PATH="$HOME/.pyenv/shims:/usr/local/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"
    
    # Ruby
    export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH" # binaries installed by homebrew gem
    export PATH="/usr/local/opt/ruby/bin:$PATH" # homebrew ruby

    # source Homebrew's virtualenvwrapper
    source "/usr/local/bin/virtualenvwrapper.sh"

    # colorls
    source $(dirname $(gem which colorls))/tab_complete.sh

elif [[ "$MACHINE" == "Linux" ]]; then
    # linuxbrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    # source Homebrew's virtualenvwrapper
    source "/home/linuxbrew/.linuxbrew/bin/virtualenvwrapper.sh"
fi

source $HOME/.utils

# default to latest Python 3 installed with Homebrew
# python3.latest




