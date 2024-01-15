#!/bin/bash
sudo yum install -y docker
sudo service docker start
sudo docker run -d -p 80:80 nginxdemos/hello
