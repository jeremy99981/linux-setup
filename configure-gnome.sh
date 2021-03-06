#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Useful commands:
# - List Settings
# gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/ list-recursively org.gnome.shell.extensions.dash-to-panel


# Install extensions installer
wget -O gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
chmod +x gnome-shell-extension-installer
sudo mv gnome-shell-extension-installer /usr/bin/

sudo apt -y install gnome-tweaks

# Extensions to install
# 1160: https://extensions.gnome.org/extension/1160/dash-to-panel/
# # Replaced with 1031 # 615: https://extensions.gnome.org/extension/615/appindicator-support/
# 1031: https://extensions.gnome.org/extension/1031/topicons/
# 906: https://extensions.gnome.org/extension/906/sound-output-device-chooser/
# 1653: https://extensions.gnome.org/extension/1653/tweaks-in-system-menu/
# 708: https://extensions.gnome.org/extension/708/panel-osd/
# 1647: https://extensions.gnome.org/extension/1647/drop-down-terminal/
gnome-shell-extension-installer 1160 1031 906 1653 708 1647

# Change Settings

# General
gsettings set org.gnome.desktop.interface gtk-theme Pop-dark
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Dash to Panel
gsettings --schemadir ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/ set org.gnome.shell.extensions.dash-to-panel stockgs-panelbtn-click-only true
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Panel OSD
gsettings --schemadir ~/.local/share/gnome-shell/extensions/panel-osd@berend.de.schouwer.gmail.com/schemas/ set org.gnome.shell.extensions.panel-osd y-pos 1.0
gsettings --schemadir ~/.local/share/gnome-shell/extensions/panel-osd@berend.de.schouwer.gmail.com/schemas/ set org.gnome.shell.extensions.panel-osd x-pos 98.0

# Drop down terminal
gsettings --schemadir ~/.local/share/gnome-shell/extensions/drop-down-terminal@gs-extensions.zhb.org/ set org.zzrough.gs-extensions.drop-down-terminal transparent-terminal false
gsettings --schemadir ~/.local/share/gnome-shell/extensions/drop-down-terminal@gs-extensions.zhb.org/ set org.zzrough.gs-extensions.drop-down-terminal background-color 'rgb(51,48,47)'

sh "$SCRIPTPATH/activate-gnome-extensions.sh"
