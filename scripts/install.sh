#!/bin/bash

echo "Installing OpenCV"

# Compiler
apt-get install -y build-essential
# Required packages
apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
# Optional packages
apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

mkdir /usr/local/src/opencv
cd /usr/local/src/opencv

# Download
curl -L https://github.com/Itseez/opencv/archive/3.0.0.tar.gz | tar xz

# Install
cd opencv-3.0.0
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make && make install

# Clear
rm -rf /usr/local/src/opencv
apt-get purge -y cmake

# Known issue:
# libdc1394 error: Failed to initialize libdc1394
# Solution: disable driver
# Ref: http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394
# RUN command in Dockerfile doesn't work, since docker creates and copys volume of default filesystem each time
ln /dev/null /dev/raw1394

echo "OpenCV ready to be used"

