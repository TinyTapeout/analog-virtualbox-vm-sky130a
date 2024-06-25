#!/bin/sh

set -e

# docker install instructions from https://docs.docker.com/engine/install/ubuntu/
# need a newer one than the stock
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin      

# groups
sudo groupadd -f docker 
sudo usermod -aG docker $USER
newgrp docker

# then openlane
export OPENLANE_ROOT=~/openlane

git clone --depth=1 --branch $OPENLANE_TAG https://github.com/The-OpenROAD-Project/OpenLane.git $OPENLANE_ROOT
cd $OPENLANE_ROOT
make pull-openlane

# setup env vars
echo 'export OPENLANE_ROOT=~/openlane' >> ~/.profile 
echo 'export OPENLANE_IMAGE_NAME=efabless/openlane:$OPENLANE_TAG' >> ~/.profile
