#!/bin/bash

sudo systemctl enable docker.service
sudo systemctl start docker.service

gpasswd -a $USER docker

exec $SHELL

docker run hello-world


