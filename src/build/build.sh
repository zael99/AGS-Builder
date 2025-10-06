#!/usr/bin/env bash

# Install Terminal Customizations
pacman -Syu git \
            zsh \
            fish \
            npm \
            sass \
            yay

yay -S libastal-meta
yay -S aylurs-gtk-shell-git

paccache -r

# Set zsh as the default shell
# chsh -s $(which zsh)
