#!/usr/bin/env bash

# exports

export PYTHON_PROJECT_DIR=$PROJECT_HOME
export CURRENT_DEV_PROJECT=$HOME"/Dev_Workspace/Current_Project/"

# Function to sync two folders using rsync
### dsync()
# --delete flag tells rsync to delete files in dest_dir when they no longer exist in src_dir
# --filter=':- .gitignore' tells rsync to exclude the files that are listed in the .gitignore file in each directory
# --chmod='F-w' portion tells rsync that the copied files (but not directories) should have their write permissions removed
# it prevents us from accidentally going into the dest_dir instead of the authoritative src_dir and making edits.
# The function takes 2 parameters:
# $src_dir gets the first given argument
# $dest_dir gets the second
# inspired from Adam Shaw (https://arshaw.com/exclude-node-modules-dropbox-google-drive)
dsync() {
  #!/usr/bin/env bash
  set -e # always immediately exit upon error

  # directory config. ending slashes are important!
  src_dir=$1
  dest_dir=$2

  # run the sync
  rsync -ar --delete \
  --filter=':- .gitignore' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --chmod='F-w' \
  "$src_dir" "$dest_dir"
}

# Works on hidden files, directories and regular files
### isEmpty()
# This function takes one parameter:
# $1 is the directory to check or defaults to current directory
# -- Echoes if the directory has files or not
function isEmpty() {
  dir="${1:-"$PWD"}" # defaults to current dir if no argument

  if [ "$(ls -A "$dir")" ]; then
    echo "The directory contains files"
    return 1
  else 
    echo "The directory is empty (or doesn't exist on this path)"
    return 0
  fi
}

# Clear directory content if directory is not empty
### clean_dir()
# This function takes one parameter:
# $1 is the directory to clear or defaults to current directory
# -- Calls isEmpty to check if directory contains files
clear_dir() {
  if ! (isEmpty "${@:-"$PWD"}"); then
    ls -la
    # Remove all files including hidden .files
    rm -vrf "${PWD:?}/"* # this form ensures it never expand to root folder
    rm -vrf "${PWD:?}/".*
  fi
}

# Get current directory name without full path
### here()
here() {
  local here=${PWD##*/}
  printf '%q\n' "$here"
}

# function to backup current dev project 
### save_dev_project()
# Note:Backup directory must exist and be empty!
save_dev_project() {
  local BACKUP=$1 || $PWD

  if (isEmpty "$BACKUP"); then
    echo "Backing up"
    dsync $CURRENT_DEV_PROJECT "$BACKUP" || { echo "Failure to backup to $BACKUP"; exit; }
    echo "Backup done!"
  else
    echo "Destination folder not empty"
    echo "Cannot backup folder on non empty folder"
  fi
}

workon_dev_project() {
  mkdir "$CURRENT_DEV_PROJECT$(here)"
  cp -R "$PWD"/ $CURRENT_DEV_PROJECT"$(here)"
  workspace=$CURRENT_DEV_PROJECT"$(here)"
  echo "Copied the content of dev project to ${workspace}"
  cd "$workspace"
  echo "Switched to $(workspace) folder"
}

# function to remove duplicates in and echo $PATH
### no_dupes_path()
# Note: Inspired from https://www.linuxjournal.com/content/removing-duplicate-path-entries
no_dupes_path() {
  local no_dupes_path
  no_dupes_path=$(echo $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
  echo "$no_dupes_path"
}

# function to echo $PATH one entry per line
### no_dupes_path()
# Note: Inspired from https://www.linuxjournal.com/content/removing-duplicate-path-entries
show_path(){
  awk -v RS=: '{print}' <<< "$PATH"
}

# function to set $PATH with no dupes and echo one entry per line
### no_dupes_path()
# Note: Inspired from https://www.linuxjournal.com/content/removing-duplicate-path-entries
set_no_dupes_path() {
  export PATH=$(no_dupes_path)
  show_path
}