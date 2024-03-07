#! /bin/sh

set -e

sudo apt-get install -y libgtk-3-dev

git clone https://github.com/StefanSchippers/xschem-gaw /tmp/xschem-gaw
cd /tmp/xschem-gaw
./configure
make -j4
sudo make install
rm -rf /tmp/xschem-gaw
