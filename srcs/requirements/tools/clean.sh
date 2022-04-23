#!/bin/bash

if grep "127.0.0.1	mfunyu.42.fr" /etc/hosts > /dev/null; then
sudo sed -i -e "/127\.0\.0\.1	mfunyu\.42\.fr/d" /etc/hosts
fi

sudo rm -Rf sudo /home/mfunyu/data