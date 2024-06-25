#!/bin/sh

set -e

sudo apt install git make autoconf g++ flex bison help2man

git clone https://github.com/verilator/verilator verilator-src
cd verilator-src
unset VERILATOR_ROOT
git checkout $VERILATOR_VERSION
autoconf
./configure
make -j$(nproc)
sudo make install

