#!/bin/bash -e

apt update
apt install -y build-essential devscripts debhelper \
    wget \
    libusb-1.0

cd base-src
make
