FROM node:0.12.5-slim

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y libopencv-dev

RUN apt-get install -y python-dev python-numpy python-opencv libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# Known issue:
# libdc1394 error: Failed to initialize libdc1394
# Solution: disable driver
# Ref: http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394
# Do the following in the container later for ignoring the warning
RUN ln /dev/null /dev/raw1394
# RUN command in Dockerfile doesn't work, since docker creates and copys volume of default filesystem each time
