#! /bin/sh

set -e

sudo apt-get install -y libgtk-3-dev gettext automake

git clone https://github.com/StefanSchippers/xschem-gaw /tmp/xschem-gaw
cd /tmp/xschem-gaw
sed -i 's/GETTEXT_MACRO_VERSION = 0.18/GETTEXT_MACRO_VERSION = 0.20/' po/Makefile.in.in
aclocal && autoconf && autoheader && automake --add-missing
./configure
make -j4
sudo make install
rm -rf /tmp/xschem-gaw
