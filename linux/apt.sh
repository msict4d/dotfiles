
# ########
# Binaries
# ########
sudo apt install autojump -y
sudo apt install tree -y  
sudo apt install xclip -y
sudo apt install youtube-dl -y

# Python
# Install [Python build dependencies](https://github.com/pyenv/pyenv/wiki#suggested-build-environment) before attempting to install a new Python version:
	
sudo apt update; sudo apt install --no-install-recommends make \
build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev \
libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Node 
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs -y

# MongoDB for Ubuntu 18.04. 
# Installation instructions: https://docs.mongodb.com/manual/administration/install-on-linux/
# wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
# echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
# sudo apt update
# sudo apt install -y mongodb-org

# ubuntu-make
sudo add-apt-repository ppa:lyzardking/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make
