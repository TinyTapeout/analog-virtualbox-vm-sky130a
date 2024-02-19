#!/bin/sh

set -e

curl -o /tmp/klayout.deb https://www.klayout.org/downloads/Ubuntu-22/klayout_$KLAYOUT_VERSION-1_amd64.deb
sudo apt-get install -y /tmp/klayout.deb
rm /tmp/klayout.deb

# Add icon to the desktop
mkdir -p ~/Desktop
cat << EOF > ~/Desktop/klayout.desktop
[Desktop Entry]
Exec=klayout %f
Name=KLayout
Comment=Layout Viewer
Icon=klayout
Type=Application
Categories=Development;Engineering;Electronics;
EOF
gio set ~/Desktop/klayout.desktop metadata::trusted true
chmod a+x ~/Desktop/klayout.desktop
