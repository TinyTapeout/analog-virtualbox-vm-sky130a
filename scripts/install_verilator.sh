#!/bin/sh

set -e

sudo apt-get install -y git make autoconf g++ flex bison help2man

git clone https://github.com/verilator/verilator /tmp/verilator-src
cd /tmp/verilator-src
unset VERILATOR_ROOT
git checkout $VERILATOR_VERSION
autoconf
./configure
make -j$(nproc)
sudo make install

# cleanup
rm -rf /tmp/verilator-src
