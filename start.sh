#!/bin/bash

# Install all dependencies
echo "Starting new setup"
sudo pacman -S firefox rofi tmux polybar picom alacritty

# Installing Rofi Themes
cd ~/
mkdir Documents Downloads Repos
cd ~/Repos
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd Rofi
chmod +x setup.sh
./setup.sh

# Stow all the config files into their correct spot
cd ~/DotFiles
stow */

echo "Setup Complete!"
