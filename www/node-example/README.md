# Example node webserver

## How to run

Open a terminal to the workspace container

```Shell
docker-compose exec workspace bash
cd /var/www/node-example
```

Download the required packages

```Shell
yarn install
```

Run the node server

```Shell
node app.js
```

## Result

Open a browser on your host machine and visit [http://3000.localhost](http://3000.localhost)

Port 3000 & 5000 on the workspace container are linked to a subdomain on localhost on the webserver container. You can change this in `./webserver/apache/vhosts.conf`