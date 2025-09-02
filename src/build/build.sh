#!/usr/bin/env bash

installGnim() {(
    dnf install -y \
        gjs-devel \
        gtk4-devel \
        npm

    npm install gnim
    npm install typescript esbuild @girs/gtk-4.0 @girs/gjs -D
)}

installAstal() {(
    git clone https://github.com/aylur/astal.git /tmp/astal

    # Build Astal
    cd /tmp/astal/lib/astal/io
    meson setup build
    meson install -C build

    cd /tmp/astal/lib/astal/gtk3
    meson setup build
    meson install -C build

    cd /tmp/astal/lib/astal/gtk4
    meson setup build
    meson install -C build

    #Cleanup Astal Build
    cd ~
    rm -rf /tmp/*
)}

installAGS() {(
    git clone --recurse-submodules https://github.com/aylur/ags /tmp/ags

    # Build AGS
    cd /tmp/ags
    npm install
    meson setup build
    meson install -C build

    #Cleanup AGS Build
    cd ~
    rm -rf /tmp/*
)}

installAGSDependencies() {(
    dnf install -y \
        gjs \
        gjs-devel \
        gtk4-devel \
        meson \
        npm \
        gtk3-devel \
        gtk-layer-shell-devel \
        gtk4-devel \
        gtk4-layer-shell-devel \
        gobject-introspection-devel
        ninja \
        go \
        golang \
        vala \
        wayland-protocols-devel
)}

# Install Terminal Customizations
dnf update -y

# Install base dependencies
dnf install -y \
    git \
    zsh \
    fish
    
installAGSDependencies
installAstal
installAGS

# Set zsh as the default shell
# chsh -s $(which zsh)