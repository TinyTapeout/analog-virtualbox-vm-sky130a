#! /bin/sh

set -e

sudo apt-get install -y build-essential libxaw7-dev libreadline-dev autoconf automake libtool

git clone -b ngspice-$NGSPICE_VERSION git://git.code.sf.net/p/ngspice/ngspice /tmp/ngspice

cd /tmp/ngspice
./autogen.sh
mkdir release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp --enable-osdi
make -j4
sudo make install
sudo rm -rf /tmp/ngspice

cp $PDK_ROOT/sky130A/libs.tech/ngspice/spinit ~/.spiceinit
