#!/bin/bash

# List of brew packages to install
brewList=(
    "aspect"
    "awscli"
    "buildifier"
    "ca-certificates"
    "cairo"
    "cffi"
    "circleci"
    "cryptography"
    "fontconfig"
    "freetype"
    "gettext"
    "gh"
    "giflib"
    "git"
    "glib"
    "go"
    "graphite2"
    "harfbuzz"
    "icu4c@76"
    "jpeg-turbo"
    "kubernetes-cli"
    "libidn2"
    "libpng"
    "libtiff"
    "libunistring"
    "libx11"
    "libxau"
    "libxcb"
    "libxdmcp"
    "libxext"
    "libxrender"
    "libyaml"
    "little-cms2"
    "lz4"
    "lzo"
    "minikube"
    "mpdecimal"
    "nvm"
    "openjdk@21"
    "openssl@3"
    "pcre"
    "pcre2"
    "pixman"
    "pre-commit"
    "pycparser"
    "python-packaging"
    "python@3.11"
    "python@3.12"
    "python@3.13"
    "readline"
    "shellcheck"
    "sqlite"
    "the_silver_searcher"
    "wget"
    "xorgproto"
    "xz"
    "zstd"
)

# List of cask packages to install
caskList=(
    "betterdisplay"
    "google-chrome"
    "google-cloud-sdk"
    "google-drive"
    "iterm2"
    "notion"
    "notion-calendar"
    "rectangle"
    "slack"
    "visual-studio-code"
)

brewInstall() {
    for i in "${brewList[@]}"
    do
        brew install $i
    done
}

caskInstall() {
    for i in "${caskList[@]}"
    do
        brew install --cask $i
    done
}

echo "Installing brew packages..."
brewInstall

echo "Installing cask packages..."
caskInstall