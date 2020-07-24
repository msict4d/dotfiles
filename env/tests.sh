#!/usr/bin/env bash

# exports

export PYTHON_PROJECT_DIR=$PROJECT_HOME
export CURRENT_DEV_PROJECT="/Volumes/Data/Dev-Dependencies/Current_Project/"

# function to backup current dev project 
# inspired from Adam Shaw (https://arshaw.com/exclude-node-modules-dropbox-google-drive)
copy_dev_project() {
  #!/usr/bin/env bash
  set -e # always immediately exit upon error

  PROJECT_DIR=$1 || $(pwd) # take the provided folder if argument given

  # directory config. ending slashes are important!
  src_dir=$CURRENT_DEV_PROJECT
  dest_dir=$PROJECT_DIR

  # run the sync
  rsync -ar --delete \
  --filter=':- .gitignore' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --chmod='F-w' \
  "$src_dir" "$dest_dir"
}

clean() {
  # Remove all files including hidden .files
  rm -vrf $(pwd)/*
  rm -vrf $(pwd)/.*
}