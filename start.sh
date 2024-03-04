#!/bin/bash

# Install all dependencies
echo "Starting new setup"
sudo pacman -S firefox rofi tmux polybar picom alacritty zsh stow base-devel

# Installing Rofi Themes
cd ~/
mkdir Documents Downloads Repos
cd ~/Repos
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd Rofi
chmod +x setup.sh
./setup.sh

# Installing zsh-autocomplete
cd ~/Repos
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

# Installing yay for AUR
cd ~/Repos
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Installing oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Stow all the config files into their correct spot
cd ~/DotFiles
stow */

echo "Setup Complete!"
