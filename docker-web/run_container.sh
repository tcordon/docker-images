#!/bin/bash

#Run RabbitMQ docker container
docker run -d --hostname my-rabbit --name some-rabbit -e RABBITMQ_HIPE_COMPILE=1 rabbitmq:3

#Run App Container linked to RabbitMQ container.
docker run -tid -p 85:80 --name="apache_server_mc" -v /mnt/hgfs/LOCAL_PROJECTS/rmcskin/:/var/www/ --link some-rabbit:rabbit tcordon/apache-php:v0.2
