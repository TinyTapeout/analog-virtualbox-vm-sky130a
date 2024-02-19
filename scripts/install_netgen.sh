#! /bin/sh

set -e

sudo apt-get install -y m4 tcl-dev tk-dev

git clone -b $NETGEN_VERSION https://github.com/RTimothyEdwards/netgen /tmp/netgen
cd /tmp/netgen
./configure
make -j4
sudo make install
sudo rm -rf /tmp/netgen
