#!/usr/bin/env bash

echo "UPDATING"
pacman -Syu --noconfirm

echo "INSTALLING GIT"
pacman -S --noconfirm --needed base-devel git

echo "BUILDING YAY"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

echo "INSTALLING DEPENDENCIES"
pacman -S --noconfirm --needed \
    zsh \
    fish \
    npm \
    sass

echo "INSTALLING AGS"
yay -Syu libastal-meta aylurs-gtk-shell-git

# paccache -r

# Set zsh as the default shell
# chsh -s $(which zsh)
