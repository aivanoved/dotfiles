#!/bin/bash

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

check_installed(){
    echo 'Check for' $1
    if command -v $1 &> /dev/null; then
        echo $1 'installed'
        return 0
    else
        echo $1 'not installed'
        return 1
    fi
}

install_package(){
    for package in $@; do
        if ! check_installed $package; then
            echo 'Installing' $package
            exec $(install_str) $package
        fi
    done
}

install_str(){
    if [[ $platform == 'debian' ]]; then
        echo 'sudo apt-get install'
    elif [[ $platform == 'macos' ]]; then
        echo 'brew install'
    fi 
}

install_curl(){
    if [[ $platform == 'debian' ]]; then
        check_installed 'curl' || sudo apt-get install curl
    elif [[ $platform == 'macos' ]]; then
        check_installed 'curl' || \
        { echo 'curl should come with macos' && \
        \
        return 1; }
    fi
}

install_package_manager(){
    if [[ $platform == 'debian' ]]; then
        echo 'debian comes with apt-get'
    elif [[ $platform == 'macos' ]]; then
        echo 'Installing package manager'
        check_installed 'brew' || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

install_zsh(){
    install_package zsh
    if [[ $platform == 'debian' ]]; then
        chsh -s /usr/local/bin/zsh
    elif [[ $platform == 'macos' ]]; then
        chsh -s $(brew --prefix)/bin/zsh; \
    fi
}

unknown='unknown'

# get the platform
platform=$unknown
os_version=$unknown
arch=$unknown

osname=$(lowercase $(uname))
kernel=$(uname -r)
mach=$(uname -m)

version=$(lowercase $(uname -v))

case $osname in
    'linux')
        platform='linux'
        case $version in
            *'ubuntu'*)
                platform='debian'
                ;;
        esac
        ;;
    'darwin')
        platform='macos'
        ;;
esac

echo 'platform' $platform

install_curl
install_package_manager
install_zsh
