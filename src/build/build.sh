#!/usr/bin/env bash

installGnim() {(
    apt-get install -y --quiet --no-install-recommends \
        libgjs-dev \
        libgtk-3-dev \
        npm

    npm install gnim
    npm install typescript esbuild @girs/gtk-4.0 @girs/gjs -D
)}

installAstal() {(
    apt-get install -y --quiet --no-install-recommends \
        software-properties-common

    # Install Astal
    apt-get install -y --quiet --no-install-recommends \
        meson \
        vala \
        valadoc \
        gobject-introspection-devel \
        wayland-protocols-devel \
        gtk3-devel gtk-layer-shell-devel \
        gtk4-devel gtk4-layer-shell-devel

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
    rm -rf /tmp/*
)}

installAGS() {(
    installGnim
    installAstal

    apt-get install -y --quiet --no-install-recommends \
        ninja \
        golang

    git clone --recurse-submodules https://github.com/aylur/ags /tmp/ags

    # Build AGS
    cd /tmp/ags
    meson setup build
    meson install -C build

    #Cleanup AGS Build
    rm -rf /tmp/*
)}

# Install Terminal Customizations
apt-get update
apt-get install -y --quiet --no-install-recommends \
    zsh \
    fish \
    gjs

installAGS

# Set zsh as the default shell
# chsh -s $(which zsh)