
# Source shared .bash and .zshconfiguration (.rc)
source $HOME/.init

# Adding pyenv to path here for Bash config after seeing this 
# [WARNING: pyenv init - no longer sets PATH. Issue #1906](https://github.com/pyenv/pyenv/issues/1906) 
# See function definitions in ../env/functions.sh
set_pyenv
