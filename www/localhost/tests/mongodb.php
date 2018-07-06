<?php

require '../vendor/autoload.php';

$client = new MongoDB\Client("mongodb://mongodb:27017");

if ($client == true) {
    echo 'Connected to MongoDB!<br>';
    var_dump($client);
}

?>