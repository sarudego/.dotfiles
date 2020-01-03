#!/bin/bash

# Python
sudo apt-add-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3 python3-pip

# Pip programs
pip install --user yapf
