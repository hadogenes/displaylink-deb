#!/bin/bash -e

apt update
apt install -y build-essential devscripts debhelper wget

cd base-src
make
