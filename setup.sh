#!/bin/bash

set -e

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
mv install-magento.sh magento/.
mv composer.json.magento magento/composer.json

docker-compose down
docker-compose up -d --build

# Install Magento and setup PHPUnit.
docker exec -it web-magento1-phpunit bash -c "cd app && bash install-magento.sh"