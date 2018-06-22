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
* phpMyAdmin
* MongoDB

## Requirements

Docker Engine 1.13.0+ (support for docker-compose v3)

## Installation

Download the repository:

```Shell
git clone https://github.com/RobinWijnant/docker-compose-web-stack.git
```

Execute in the root of the repository:

```Shell
docker-compose up -d
```

**Note:** Warnings that occur during the docker build are related to the image, not to this dev stack.

## Configuration

### Making a virtualhost

Add the following line to `/webserver/apache2/vhosts.conf` and create a new folder `/www/example.localhost`

```ApacheConf
Use VHost example.localhost
```
**Note:** Using *.localhost is recommended because it does not require to add an entry in the hosts file of your PC. Other domains like example.com work as well.

### Bash cli on a container

Execute in the root of the repository:

```Shell
docker exec -it dev_stack__mysql bash
```

All container names:

* dev_stack__webserver
* dev_stack__mysql