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
source $HOME/.rc

# z - Fast navigation, see [this gist](https://gist.github.com/mischah/8149239)

if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi


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
elif [[ "$MACHINE" == "Linux" ]]; then
    # linuxbrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# colorls
source $(dirname $(gem which colorls))/tab_complete.sh



