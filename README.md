# Dev stack using docker-compose

## Features

* Apache 2
    * Config file available
    * Vhost support
* PHP 7.x
    * php.ini file available
    * PDO_MYSQL extension
    * XDebug extension
    * ImageMagick extension
* MySQL 8.x
    * Config file available
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

## Usage

### MySQL

When installed, MySQL 8 uses by default the caching_sha2_password plugin. This requires SSL/TLS. A valid SSL certificate on localhost is not possible. This is why this MySQL container is setup to use mysql_native_password authentication by default.

mysql_native_password authentication:

```Shell
username: root
password: root
```

caching_sha2_password authentication:

```Shell
username: root_sha256
password: root
```

PhpMyAdmin is available on: [http://phpmyadmin.localhost](http://phpmyadmin.localhost)

## Configuration

Basic settings can be changed in `.env`. All services are also configurable through an additional config file for each service. These additional config files only require a restart of the containers in order to take effect.

### Making a virtualhost

Add the following line to `/webserver/apache2/vhosts.conf` and create a new folder `/www/example.localhost`

```ApacheConf
Use VHost example.localhost
```
**Note:** Using *.localhost is recommended because it does not require to add an entry in the hosts file of your PC. Other domains like example.com work as well after modifying your hosts file.

### Bash cli on a service

```Shell
docker-compose exec webserver sh
```

All service names:

* webserver
* mysql
* phpmyadmin