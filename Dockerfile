FROM node:0.12.3-slim

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y libopencv-dev

# Known issue:
# libdc1394 error: Failed to initialize libdc1394
# Solution: disable driver
# Ref: http://stackoverflow.com/questions/12689304/ctypes-error-libdc1394-error-failed-to-initialize-libdc1394
RUN ln /dev/null /dev/raw1394

WORKDIR /usr/src/app

CMD ["npm", "start"]
