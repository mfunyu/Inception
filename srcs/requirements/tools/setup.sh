#!/bin/bash

if ! grep "127.0.0.1	mfunyu.42.fr" /etc/hosts > /dev/null; then
echo "127.0.0.1	mfunyu.42.fr" | sudo tee -a /etc/hosts
fi

sudo mkdir /home/mfunyu/data/server
sudo mkdir /home/mfunyu/data/db