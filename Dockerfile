FROM node:0.12.3-slim

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y libopencv-dev

WORKDIR /usr/src/app

CMD ["npm", "start"]
