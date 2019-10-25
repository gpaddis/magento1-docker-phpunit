#!/bin/bash

mkdir -p magento

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

searchAndReplace "/path/to/magento" "${PWD}/magento" docker-compose.yml
cp install-magento.sh magento/.

docker-compose down
docker-compose up -d --build