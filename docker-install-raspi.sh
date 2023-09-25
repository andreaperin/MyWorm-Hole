#!/bin/bash

sudo apt update && sudo apt upgrade -y

curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh

sudo usermod -aG docker ${USER}

sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip

sudo pip3 install docker-compose

sudo systemctl enable docker

sudo reboot