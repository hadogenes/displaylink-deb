#!/bin/basa -e

apt update
apt install -y build-essential devscripts debhelper wget

make
