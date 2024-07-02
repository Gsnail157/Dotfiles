#!/bin/bash

echo "Starting new setup" # Create Home Directory Folders

cd ~/
if [[ ! -d "Downloads" ]]; then
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

# INSTALL PACKAGES AND DEPENDENCIES
#
# Menu/Applets/PowerMenus -rofi
# Taskbar - polybar
# Shell - zsh
# Help manage . files - stow
# Terminal file manager - lf
# Terminal - kitty
# ls replace with icons - exa
# Screen Manager - xorg-xrandr
# Wallpaper setter = feh
# Network Manager - networkmanager
# pdf viewer - zathura, zathura-poppler
# LaTeX compiler - texlive-binextra, biber
# dunst - Notification daemon
# xorg-xbacklight - Screen brightness
sudo pacman -S rofi polybar picom zsh stow base-devel lf kitty xorg-xrandr feh networkmanager playerctl zathura zathura-poppler neovim dunst xorg-xbacklight

# Set up networkmanager
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

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
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

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

# Install zsh Theme
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"

# Download autotiling for i3
# Allows the terminal windows in i3 to auto tile themselves. No more manual window tiling
yay -S autotiling

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

# TODO

# Include downloading fonts
# Include removing the beeping noise from computer
# Include script to set network manager for PC
# Include download for xorg-xrandr
# Update the DotFiles github repo
# Include do not sleep computer if in clam shelll mode

echo "Setup Complete!"
