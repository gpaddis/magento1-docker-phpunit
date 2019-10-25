#!/bin/bash

if [ ! -d "magento" ]; then
    git clone https://github.com/OpenMage/magento-mirror.git magento
    rm -rf magento/.git
fi

# Detect OS
case `uname -s` in
    Darwin) is_macos=yes ;;
    *) is_macos=no ;;
esac

searchAndReplace() {
    local original="$1"
    local replacement="$2"
    local file="$3"
    if [ "$is_macos" = no ]; then
        sed -i "s%${original}%${replacement}%g" $file
    elif [ "$is_macos" = yes ]; then
        sed -i '' "s%${original}%${replacement}%g" $file
    fi
}

searchAndReplace "/path/to/magento" "${PWD}/magento"

docker-compose up -d --build