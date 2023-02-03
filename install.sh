lowercase(){
    echo "$1" | sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/"
}

# get the platform
platform='unknown'
os_version='unknown'
arch='unknown'

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
