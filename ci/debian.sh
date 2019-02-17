#!/bin/bash -e

apt update
apt install -y build-essential devscripts debhelper \
    wget \
    libusb-1.0

cd base-src

# Install deps
yes | mk-build-deps -i || true
rm -f displaylink-build-deps_*.deb

make

mkdir deb

for deb in *.deb; do
    filename=$(basename "$deb" .deb)
    mv "$deb" "deb/${filename}-${OS_VERSION}.deb"
done
