#!/usr/bin/env bash

pacman -Syu --noconfirm

pacman -S --noconfirm --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

pacman -S --noconfirm --needed \
    zsh \
    fish \
    npm \
    sass

yay -Syu libastal-meta aylurs-gtk-shell-git

# paccache -r

# Set zsh as the default shell
# chsh -s $(which zsh)
