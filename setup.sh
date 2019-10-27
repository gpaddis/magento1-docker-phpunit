#!/bin/bash

set -e

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

docker-compose down
docker-compose up -d --build

# Install Magento and setup PHPUnit, if not already installed.
if [ ! -f magento/app/etc/local.xml ]; then
    docker exec -it web-magento1-phpunit bash -c "cd app && bash install-magento.sh"
fi

# Create and initialize the test database
docker exec -it mysql-magento1-phpunit bash -c "mysql -uroot -proot -e 'DROP SCHEMA IF EXISTS magento_tests; CREATE SCHEMA magento_tests'"
echo "Initializing the test database (this can take up to a few minutes)..."
docker exec -it web-magento1-phpunit bash -c "cd app && ./vendor/bin/phpunit"