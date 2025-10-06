#!/usr/bin/env bash

# Install Terminal Customizations
pacman -Syuc git \
            zsh \
            fish \
            npm \
            sass \
            yay

yay -Syu libastal-meta aylurs-gtk-shell-git

# paccache -r

# Set zsh as the default shell
# chsh -s $(which zsh)
