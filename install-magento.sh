MAGENTO_DB_HOST=mysql-magento1-phpunit
MAGENTO_DB_USER=root
MAGENTO_DB_PASS=root
MAGENTO_DB_NAME=magento
MAGENTO_DB_PORT=3306
MAGENTO_VERSION=magento-mirror-1.9.4.0
MAGENTO_BASE_URL=http://www.magento1-phpunit.local/

if [ ! -f "n98-magerun.phar" ]; then
    wget https://files.magerun.net/n98-magerun.phar
fi

php n98-magerun.phar install --dbHost="${MAGENTO_DB_HOST}" --dbUser="${MAGENTO_DB_USER}" --dbPass="${MAGENTO_DB_PASS}" --dbName="${MAGENTO_DB_NAME}" --dbPort="${MAGENTO_DB_PORT}" --installSampleData=no --useDefaultConfigParams=yes --magentoVersionByName="${MAGENTO_VERSION}" --installationFolder="${PWD}" --baseUrl="${MAGENTO_BASE_URL}"
composer install