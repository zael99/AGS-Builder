#!/usr/bin/env bash

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
