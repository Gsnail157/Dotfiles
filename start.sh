#!/bin/bash

echo "Starting new setup"

# Create Home Directory Folders

cd ~/
if [[ ! -d "Downloads "]]; then
    mkdir Downloads
fi

if [[ ! -d "Repos" ]]; then
    mkdir Repos
fi

if [[ ! -d "Documents" ]]; then
    mkdir Documents
fi

if [[ ! -d "Pictures" ]]; then
    mkdir Pictures
fi

# Install all dependencies
sudo pacman -S firefox rofi polybar picom zsh stow base-devel lf kitty exa

# Installing Rofi Themes
cd ~/Repos
git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi
chmod +x setup.sh
./setup.sh

# Installing zsh-autocomplete
cd ~/Repos
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git

# Installing tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Installing yay for AUR
cd ~/Repos
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Installing ctpv for image preview in lf
yay -S ctpv-git

# Installing Icons for LF terminal file manager
mkdir -p ~/.config/lf
curl https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example -o ~/.config/lf/icons

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Stow all the config files into their correct spot
cd ~/DotFiles
stow i3
stow lf
stow neofetch
stow nvim
stow picom
stow polybar
stow scripts
stow wallpapers
stow zsh
stow kitty

echo "Setup Complete!"
