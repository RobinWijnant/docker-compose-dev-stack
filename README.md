# Web stack using docker-compose

## Features

* Apache 2
    * Custom global config
    * Vhost support
* PHP 7.x
    * Custom php.ini
    * PDO_MYSQL extension
    * XDebug extension
    * ImageMagick extension
* MySQL 8.x
* MongoDB

## Configuration

### Making a virtualhost

Add the following line to `/webserver/apache2/vhosts.conf` and create a new folder `/www/example.localhost`

```ApacheConf
Use VHost example.localhost
```
**Note:** Using *.localhost is recommended because it does not require to add an entry in the hosts file of your PC.
