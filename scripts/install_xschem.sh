#! /bin/sh

set -e

sudo apt-get install -y make gcc libx11-6 libx11-dev libxrender1 libxrender-dev libxcb1 libx11-xcb-dev libcairo2 \
	libcairo2-dev tcl8.6 tcl8.6-dev tk8.6 tk8.6-dev flex bison libxpm4 libxpm-dev libjpeg-dev xterm vim-gtk3 \
	gawk tcl-tclreadline

git clone -b $XSCHEM_VERSION https://github.com/StefanSchippers/xschem /tmp/xschem
cd /tmp/xschem
./configure
make -j4 
sudo make install
rm -rf /tmp/xschem

# Add icon to the desktop
mkdir -p ~/Desktop
cat << EOF > ~/Desktop/xschem.desktop
[Desktop Entry]
Exec=/usr/local/bin/xschem 
InitialPreference=2
MimeType=application/xschem;
Name=Xschem
Comment=Schematic capture
Icon=xschem
Terminal=false
Type=Application
Categories=Graphics;
Keywords=CAD;simualtion;design;drawing;
EOF
gio set ~/Desktop/xschem.desktop metadata::trusted true
chmod a+x ~/Desktop/xschem.desktop

mkdir -p ~/.icons
cat << EOF | base64 -d > ~/.icons/xschem.png
iVBORw0KGgoAAAANSUhEUgAAAEoAAAANAQMAAAA0Q2rmAAAABlBMVEX/AAD///9BHTQRAAAACXBI
WXMAAA7EAAAOxAGVKw4bAAAAc0lEQVQImWOQs+F/UPGjQaKGgYHPgL3BAsi0YGDoKXzcJ/Gj/4eF
GsOBz4/lYcyP/+V/gJh6DA8/2Mv/YGiwAKp9+IPdHsScBGT+b7YHKQAyD/x/LA9lnvn8GWzCJLC5
/SDmMQYGOQNmsG0gpgX7gQowEwD3DUFJs0oq9AAAAABJRU5ErkJggg==
EOF
