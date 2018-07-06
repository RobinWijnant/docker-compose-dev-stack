#!/bin/bash

# Run composer and yarn install for the dashboard
cd /var/www/html/localhost
composer install
yarn install

# Keep the container up
tail -f /dev/null