#!/bin/bash

# Change this value your custom location
CLONE_PATH=$GITHUB_FOLDER

function clone () {
	# CD to folder where git repos are kept
	cd $CLONE_PATH

  echo "Cloning repositories"

  # Open source projects
    # python
    git clone https://github.com/vinta/awesome-python.git
    git clone https://github.com/trimstray/the-book-of-secret-knowledge.git

  # Blog

  # Products
  
}

clone
unset clone
