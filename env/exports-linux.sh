#!/bin/bash

init_virtualenvwrapper() { # modified 2021-04-01
  # set custom virtual environments location	
  export VENV_FOLDER=$DEV_WORKSPACE/Python/Virtualenvs/
  # set virtualenvwrapper env variables
  export WORKON_HOME=$VENV_FOLDER
  export PROJECT_HOME=$DEV_WORKSPACE/Python/Projects
  export VIRTUALENVWRAPPER_PYTHON=$PYTHON
  export VIRTUALENVWRAPPER_VIRTUALENV=$VIRTUALENV
}