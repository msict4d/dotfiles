
# Adding pyenv to path here for ZSH config after seeing this
#  [WARNING: pyenv init - no longer sets PATH. Issue #1906](https://github.com/pyenv/pyenv/issues/1906) 

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"