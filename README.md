# PHPUnit & Magento 1: Docker Tests Container

## Setup
Clone the repository anywhere on your disk and run `./setup.sh`. The setup script will link the script `phpunit-magento` in your /usr/local/bin directory.

## Usage
Run `phpunit-magento` inside a module directory: the command will run the test suite for your module inside the container. You can optionally pass the name of a test class or method as a parameter to filter the test execution.