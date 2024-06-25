#!/bin/sh

set -e

sudo apt install -y git make autoconf g++ flex bison help2man

git clone https://github.com/verilator/verilator /tmp/verilator-src
cd /tmp/verilator-src
unset VERILATOR_ROOT
git checkout $VERILATOR_VERSION
autoconf
./configure
make -j$(nproc)
sudo make install

