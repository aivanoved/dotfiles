#!/bin/bash

lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

install_curl(){
    if [[ $1 == 'debian' ]]; then
        command -v curl &> /dev/null || sudo apt-get install curl
    elif [[ $1 == 'macos' ]]; then
        command -v curl &> /dev/null || \
        { echo 'curl should come with macos' && \
        \
        return 1; }
    fi
}

install_package_manager(){
    if [[ $1 == 'debian' ]]; then
        echo 'debian comes with apt-get'
    elif [[ $1 == 'macos' ]]; then
        command -v brew &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

install_zsh(){
    if [[ $1 == 'debian' ]]; then
        command -v zsh &> /dev/null || \
        {\
            sudo apt-get install zsh && \
            chsh -s /usr/local/bin/zsh; \
        }
    elif [[ $1 == 'macos' ]]; then
        command -v zsh &> /dev/null || \
        {\
            brew install zsh && \
            chsh -s $(brew --prefix)/bin/zsh; \
        }
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

echo $platform

install_curl $platform
install_package_manager $platform
install_zsh $platform
