#!/usr/bin/env bash

# https://github.com/liumapp/docker-compose-demo

### install java
# https://openjdk.java.net/install/

yum install -y maven

./build-image.sh

docker-compose up -d

wget http://127.0.0.1:1234
wget http://127.0.0.1:2333
wget http://127.0.0.1:7001
wget http://127.0.0.1:8081
wget http://127.0.0.1:8082
