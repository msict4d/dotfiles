#!/bin/bash 

# IMPORTANT: Change Mass to your profile name
STARTUP="/mnt/c/Users/Mass/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"

echo "Creating hardlinks to startup directory"
for file in windows/startup-scripts/*; do 
  ln -fv "$file" "$STARTUP"
done