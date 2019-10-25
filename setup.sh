#!/bin/bash

if [ ! -d "magento" ]; then
    git clone https://github.com/OpenMage/magento-mirror.git magento
    rm -rf magento/.git
fi

docker-compose up -d --build