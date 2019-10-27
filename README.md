# PHPUnit & Magento 1: Docker Tests Container
A container setup to run your Magento 1 module test suite with [Ecomdev PHPUnit](https://github.com/EcomDev/EcomDev_PHPUnit) on your machine. Zero effort required.

## Setup
Clone the repository anywhere on your disk and run `./setup.sh`. The setup script will link the script `phpunit-magento` in your /usr/local/bin directory.

## Usage
Run `phpunit-magento` inside a module directory: the command will run the test suite for your module inside the container. You can optionally pass the name of a test class or method as a parameter to filter the test execution.

## Reset
If you mess up the test database, simply run the `setup.sh` script again. This will reset and rebuild container + database and will allow you to start with a fresh setup.