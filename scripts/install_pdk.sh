#! /bin/sh

set -e

sudo apt-get install -y pipx
pipx ensurepath
export PATH=$PATH:$HOME/.local/bin
pipx install volare
volare enable $PDK_VERSION
echo "export PDK_ROOT=$PDK_ROOT" >> ~/.profile

cp $PDK_ROOT/sky130A/libs.tech/ngspice/spinit ~/.spiceinit
