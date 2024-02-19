#! /bin/sh

set -e 

mkdir -p ~/Desktop
cat << EOF > ~/Desktop/terminal.desktop

[Desktop Entry]
Name=Terminal
Exec=/usr/bin/gnome-terminal
Icon=terminal
Terminal=false
Type=Application
Categories=Application
EOF

gio set ~/Desktop/terminal.desktop metadata::trusted true
chmod a+x ~/Desktop/terminal.desktop
